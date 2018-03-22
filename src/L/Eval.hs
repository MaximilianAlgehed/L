module L.Eval where

import qualified Data.Set as S
import Control.Monad.State
import qualified Data.Map as M
import Data.Maybe

import L.CoreLanguage

type EvalM a = StateT EvalState (Either String) a

data EvalState = ES { definitions :: M.Map Name ([Name], Body)
                    , next :: Int }

runEval :: M.Map Name ([Name], Body) -> EvalM a -> Either String a
runEval ds ev = evalStateT ev (ES ds 0)

getNext :: EvalM Name
getNext = do
  id <- gets next
  modify $ \s -> s { next = id + 1 }
  return . Name $ "_#fresh#" ++ show id

lookupDef :: Name -> EvalM ([Name], Body)
lookupDef f = do
  md <- gets (M.lookup f . definitions)
  maybe (fail "Can't find function definition") return md

normaliseProp :: Proposition -> EvalM Proposition
normaliseProp p =
 case p of
   Forall  x t p -> Forall x t <$> normaliseProp p

   Exists  x t p -> Exists x t <$> normaliseProp p

   Equal l r     -> return $ Equal l r

   Implies l r p -> Implies l r <$> normaliseProp p

   PFApp f es    -> do
    (xs, body) <- lookupDef f
    case body of
      E e -> do
        p <- toProp <$> foldM substExpr e (zip xs es)
        normaliseProp p

      _   -> fail "I don't like case statements"

   PVar n -> fail "I didn't think that could happen"

substExpr :: Expr -> (Name, Expr) -> EvalM Expr
substExpr e (x, e') = go e
  where
    fv   = free e'

    go e = case e of
      Var n
        | n == x    -> return $ e'
        | otherwise -> return $ Var n

      FApp f es
        | f == x    -> applyExpr e' <$> mapM go es
        | otherwise -> FApp f <$> mapM go es
  
      Prop p -> Prop <$> go' p

    go' p = case p of
      
      Forall y t p
        | y `elem` fv -> do
           y'      <- getNext
           Prop p' <- substExpr (Prop p) (y, Var y')
           Forall y' t <$> go' p
        | otherwise -> Forall y t <$> go' p

      Exists y t p
        | y `elem` fv -> do
           y'      <- getNext
           Prop p' <- substExpr (Prop p) (y, Var y')
           Exists y' t <$> go' p
        | otherwise -> Exists y t <$> go' p

      Equal l r     -> Equal <$> go l <*> go r

      Implies l r p -> Implies <$> go l <*> go r <*> go' p

      PFApp f es
        | f == x    -> toProp . applyExpr e' <$> mapM go es
        | otherwise -> PFApp f <$> mapM go es

      PVar n
        | n == x    -> return $ toProp e'
        | otherwise -> return $ PVar n

applyExpr :: Expr -> [Expr] -> Expr
applyExpr f xs = case f of

  FApp f es -> FApp f (es ++ xs)

  Var f     -> FApp f xs

  _         -> error "Something went badly wrong"

toProp :: Expr -> Proposition
toProp e = case e of
  
  FApp f es -> PFApp f es

  Var n     -> PVar n

  Prop p    -> p

free :: Expr -> S.Set Name
free e = case e of
  FApp _ es -> foldr S.union S.empty (map free es)

  Var n     -> S.singleton n

  Prop p    -> case p of

    Forall x _ p  -> free (Prop p) S.\\ S.singleton x

    Exists x _ p  -> free (Prop p) S.\\ S.singleton x

    Equal l r     -> S.union (free l) (free r)

    Implies l r p -> S.union (free l) (S.union (free r) (free (Prop p)))

    PFApp _ es    -> foldr S.union S.empty (map free es)

    PVar n        -> S.singleton n
