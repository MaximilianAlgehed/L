module L.TypeCheck where

import Prelude hiding (lookup)
import qualified Data.Map as M
import Control.Monad.State
import Data.Maybe

import L.Abs

data TCState = TCS { constructorTypes :: M.Map UIdent (Type, [Type])
                   , functionTypes    :: M.Map LIdent (Type, [Type])
                   , variableTypes    :: M.Map LIdent Type }

type TC a = StateT TCState (Either String) a

lookup :: Ord a => (TCState -> M.Map a t) -> a -> TC t
lookup f v = do
  ctx <- gets f
  maybe typeError return (M.lookup v ctx)

typeError :: TC a
typeError = fail "Type error"

class TypeCheckable a where
  typeCheck :: Type -> a -> TC ()

instance TypeCheckable Expr where
  typeCheck t e = case e of
    EVar v     -> do
      vt <- lookup variableTypes v
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
