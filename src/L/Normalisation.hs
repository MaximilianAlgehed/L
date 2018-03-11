module L.Normalisation where

import Control.Monad.State
import qualified Data.Map as M

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
    zipWithM_ introduce xs ts
    (e, ds) <- normaliseFunctionBody f body
    pop
    return $ DFun f t xs e : ds
  d -> return [d]

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
      (e', ds) <- normaliseExpr f (EFApp t nf (map (uncurry (flip EVar)) ctx ++ [ec]))
      let vt   = exprType ec
      let t'   = foldr FunType t (map snd ctx ++ [vt])
      ds'      <- normaliseDecl $
        DFun nf t' (map fst ctx ++ [newVar]) (ECase t (EVar vt newVar) as)
      return (e', ds ++ ds')

  _ -> normaliseExpr f e

normaliseExpr :: LIdent -> Expr -> NM (Expr, [Decl])
normaliseExpr f e = case e of
  EFApp t f' xs  -> do
    es_ds <- mapM (normaliseExpr f) xs
    return $ (EFApp t f' (map fst es_ds), concatMap snd es_ds)

  ECApp t c xs  -> do
    es_ds <- mapM (normaliseExpr f) xs
    return $ (ECApp t c (map fst es_ds), concatMap snd es_ds)

  ECase t ec as -> do
    nf       <- next f
    newVar   <- next (LIdent "_")
    ctx      <- getContextList
    let vt   = exprType ec
    let t'   = foldr FunType t (map snd ctx ++ [vt])
    ds       <- normaliseDecl $
      DFun nf t' (map fst ctx) e
    return (EFApp t nf (map (uncurry (flip EVar)) ctx), ds)

  _ -> return (e, [])

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
