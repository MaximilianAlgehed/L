module L.TypeCheck where

import Prelude hiding (lookup)
import qualified Data.Map as M
import Control.Monad.State
import Data.Maybe

import L.Abs

data TCState = TCS { constructorTypes :: M.Map UIdent (Type, [Type])
                   , functionTypes    :: M.Map LIdent (Type, [Type])
                   , variableTypes    :: [M.Map LIdent Type] }

type TC a = StateT TCState (Either String) a

lookup :: Ord a => (TCState -> M.Map a t) -> a -> TC t
lookup f v = do
  ctx <- gets f
  maybe typeError return (M.lookup v ctx)

lookupVar :: LIdent -> TC Type
lookupVar v = do
  ctx <- gets variableTypes
  case [ t | Just t <- M.lookup v <$> ctx ] of
    []    -> typeError
    (t:_) -> return t

push :: TC ()
push = modify $ \s -> s { variableTypes = M.empty : variableTypes s }

pop :: TC ()
pop = modify $ \s -> s { variableTypes = drop 1 (variableTypes s) }

introduce :: LIdent -> Type -> TC ()
introduce v t = do
  ctx <- gets variableTypes
  case ctx of
    []     -> typeError
    (m:ms) -> case M.lookup v m of
      Nothing -> modify $ \s -> s { variableTypes = M.insert v t m : ms }
      Just _  -> typeError

typeError :: TC a
typeError = fail "Type error"

class TypeCheckable a where
  typeCheck :: Type -> a -> TC ()

instance TypeCheckable Body where
  typeCheck t b = case b of
    BCase x as -> do
      xt <- lookupVar x
      sequence_ [ push >> typeCheck xt p >> typeCheck t e >> pop
                | A p e <- as ]
    BExpr e -> typeCheck t e

-- Binds variables in the current context
instance TypeCheckable Pat where
  typeCheck t p = case p of
    PVar v    -> introduce v t
    PCon c ps -> do
      (rt, argst) <- lookup constructorTypes c
      unless (rt == t) typeError
      unless (length ps == length argst) typeError
      zipWithM_ typeCheck argst ps 

instance TypeCheckable Expr where
  typeCheck t e = case e of
    EVar v     -> do
      vt <- lookupVar v
      unless (t == vt) typeError
    ECon c     -> do
      (rt, argst) <- lookup constructorTypes c
      unless (rt == t) typeError
      unless (null argst) typeError
    EFApp f es -> do
      (rt, argst) <- lookup functionTypes f
      unless (rt == t) typeError
      unless (length es == length argst) typeError
      zipWithM_ typeCheck argst es
    ECApp c es -> do
      (rt, argst) <- lookup constructorTypes c
      unless (rt == t) typeError
      unless (length es == length argst) typeError
      zipWithM_ typeCheck argst es
