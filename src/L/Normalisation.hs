module L.Normalisation where

import Control.Monad.State
import qualified Data.Map as M
import Data.List
import Debug.Trace

import L.Abs (Type(..), LIdent(..), UIdent(..))
import L.TAbs

data ST = St { nextId        :: Int
             , variableTypes :: [M.Map LIdent Type] }

type NM a = State ST a

runNorm :: NM a -> a
runNorm m = evalState m $ St { nextId = 0, variableTypes = [] }

next :: LIdent -> NM LIdent
next (LIdent n) = do
  i <- gets nextId
  modify $ \s -> s { nextId = i + 1}
  return . LIdent $ n ++ "'" ++ show i

lookupVar :: LIdent -> NM Type
lookupVar v = do
  ctx <- gets variableTypes
  case [ t | Just t <- M.lookup v <$> ctx ] of
    []    -> fail "Error"
    (t:_) -> return t

push :: NM ()
push = modify $ \s -> s { variableTypes = M.empty : variableTypes s }

pop :: NM ()
pop = modify $ \s -> s { variableTypes = drop 1 (variableTypes s) }

introduce :: LIdent -> Type -> NM ()
introduce v t = do
  ctx <- gets variableTypes
  case ctx of
    []     -> fail "Error" 
    (m:ms) -> case M.lookup v m of
      Nothing -> modify $ \s -> s { variableTypes = M.insert v t m : ms }
      Just _  -> fail "Error"

isDefinedFunction :: LIdent -> NM Bool
isDefinedFunction f = do
  vt <- gets variableTypes
  return $ M.member f (last vt) && not (any (M.member f) (init vt))

normalise :: Program -> Program
normalise (P pgm) = runNorm $ do
  push
  sequence_ [introduce f t | DFun f t _ _ <- pgm]
  P . concat <$> mapM normaliseDecl pgm

normaliseDecl :: Decl -> NM [Decl]
normaliseDecl d = case d of
  DFun f t xs body -> do
    let (rt, ts) = split t
    push
    (xs, body) <- if length ts > length xs then do
                    newVars <- replicateM (length ts - length xs) (next (LIdent "_"))
                    let newVarsTypes = reverse $ take (length newVars) (reverse ts)
                    zipWithM_ introduce (xs ++ newVars) ts
                    return (xs ++ newVars, app rt body $ zipWith EVar newVarsTypes newVars)
                  else do
                    zipWithM_ introduce xs ts
                    return (xs, body)
    (e, ds) <- normaliseFunctionBody f body
    pop
    return $ DFun f t xs e : ds


  DThm t -> do
    (t', ds) <- normaliseTheorem t
    return $ DThm t' : ds

  d -> return [d]

normaliseTheorem :: Thm -> NM (Thm, [Decl])
normaliseTheorem t = case t of
  TUsing n p deps -> do
    (p, ds) <- normaliseExpr n p
    return $ (TUsing n p deps, ds)

normaliseFunctionBody :: LIdent -> Expr -> NM (Expr, [Decl])
normaliseFunctionBody f inputExpr = case inputExpr of
    ECase t ec as -> case ec of

      EVar _ _ -> do
        as_ds     <- mapM (normaliseAlternative f) as
        return $ (ECase t ec (map fst as_ds), concatMap snd as_ds)

      _ -> do
        nf       <- next f
        newVar   <- next (LIdent "_")
        ctx      <- free inputExpr
        let vt   = exprType ec
        let t'   = foldr FunType t (map snd ctx ++ [vt])
        (e', ds) <- normaliseExpr f (EApp t (EVar t' nf) (map (uncurry (flip EVar)) ctx ++ [ec]))
        ds'      <- normaliseDecl $
          DFun nf t' (map fst ctx ++ [newVar]) (ECase t (EVar vt newVar) as)
        return (e', ds ++ ds')

    _ -> normaliseExpr f inputExpr

normaliseExpr :: LIdent -> Expr -> NM (Expr, [Decl])
normaliseExpr f inputExpr = case inputExpr of
    EApp t fun xs  -> do
      fun_dsF <- normaliseExpr f fun
      es_ds <- mapM (normaliseExpr f) xs
      return $ (app t (fst fun_dsF) (map fst es_ds), snd fun_dsF ++ concatMap snd es_ds)

    ECase t ec as -> do
      nf       <- next f
      newVar   <- next (LIdent "_")
      ctx      <- free inputExpr
      let t'   = foldr FunType t (map snd ctx)
      ds       <- normaliseDecl $
        DFun nf t' (map fst ctx) inputExpr
      return (app t (EVar t' nf) (map (uncurry (flip EVar)) ctx), ds)

    ELam t x e -> do
      nf   <- next f
      ctx  <- free inputExpr
      let t'  = foldr FunType t (map snd ctx)
      ds   <- normaliseDecl $
        DFun nf t' (map fst ctx ++ [x]) e
      return (app t (EVar t' nf) (map (uncurry (flip EVar)) ctx), ds)

    _ -> return (inputExpr, [])

free :: Expr -> NM [(LIdent, Type)]
free e = case e of
  EVar t v -> do
    def <- isDefinedFunction v
    if def then return [] else return [(v, t)]

  ECon t c -> return []

  EApp t f es -> union <$> free f <*> (foldr union [] <$> mapM free es)

  ECase t ec as -> union <$> free ec <*> (foldr union [] <$> sequence [ (\\ vars p) <$> free e | A p e <- as ])

  ELam t v e -> filter ((/= v) . fst) <$> free e

vars :: Pat -> [(LIdent, Type)]
vars p = case p of
  PVar t v -> [(v, t)]
  PCon _ ps -> foldr union [] (vars <$> ps)

app :: Type -> Expr -> [Expr] -> Expr
app t f xs = case f of
  EApp _ f es   -> EApp t f (es ++ xs)
  ECase _ ec as -> ECase t ec [ A p (app t e xs) | A p e <- as ]
  _             -> EApp t f xs

normaliseAlternative :: LIdent -> Alt -> NM (Alt, [Decl])
normaliseAlternative f a = case a of
  A p e -> do
    push
    introducePatternVariables p
    (e', ds) <- normaliseExpr f e
    pop
    return (A p e', ds)

introducePatternVariables :: Pat -> NM ()
introducePatternVariables p = case p of
  PVar t x  -> introduce x t
  PCon _ ps -> mapM_ introducePatternVariables ps
