module L.Normalisation where

import Control.Monad.State
import qualified Data.Map as M
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

getContextList :: NM [(LIdent, Type)]
getContextList = do
  ctx <- gets variableTypes
  return . M.toList $ foldr M.union M.empty ctx

normalise :: Program -> Program
normalise (P pgm) = P . concat . runNorm . mapM normaliseDecl $ pgm

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
    (p, ds) <- normaliseProposition n p
    return $ (TUsing n p deps, ds)

normaliseProposition :: LIdent -> Proposition -> NM (Proposition, [Decl])
normaliseProposition n p = case p of
  PForall xs t p -> do
    push
    mapM (flip introduce t) xs
    (p, ds) <- normaliseProposition n p
    pop
    return (PForall xs t p, ds)

  PEqual e0 e1 -> do
    (e0, ds0) <- normaliseExpr n e0
    (e1, ds1) <- normaliseExpr n e1
    return (PEqual e0 e1, ds0 ++ ds1)

  PExpr e -> do
    (e, ds) <- normaliseExpr n e
    return (PExpr e, ds)

normaliseFunctionBody :: LIdent -> Expr -> NM (Expr, [Decl])
normaliseFunctionBody f e = case e of
    ECase t ec as -> case ec of

      EVar _ _ -> do
        as_ds     <- mapM (normaliseAlternative f) as
        return $ (ECase t ec (map fst as_ds), concatMap snd as_ds)

      _ -> do
        nf       <- next f
        newVar   <- next (LIdent "_")
        ctx      <- getContextList
        let vt   = exprType ec
        let t'   = foldr FunType t (map snd ctx ++ [vt])
        (e', ds) <- normaliseExpr f (EApp t (EVar t' nf) (map (uncurry (flip EVar)) ctx ++ [ec]))
        ds'      <- normaliseDecl $
          DFun nf t' (map fst ctx ++ [newVar]) (ECase t (EVar vt newVar) as)
        return (e', ds ++ ds')

    _ -> normaliseExpr f e

normaliseExpr :: LIdent -> Expr -> NM (Expr, [Decl])
normaliseExpr f e = case e of
    EApp t fun xs  -> do
      fun_dsF <- normaliseExpr f fun
      es_ds <- mapM (normaliseExpr f) xs
      return $ (app t (fst fun_dsF) (map fst es_ds), snd fun_dsF ++ concatMap snd es_ds)

    ECase t ec as -> do
      nf       <- next f
      newVar   <- next (LIdent "_")
      ctx      <- getContextList
      let t'   = foldr FunType t (map snd ctx)
      ds       <- normaliseDecl $
        DFun nf t' (map fst ctx) e
      return (app t (EVar t' nf) (map (uncurry (flip EVar)) ctx), ds)

    _ -> return (e, [])

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
