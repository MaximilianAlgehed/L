{-# LANGUAGE TypeFamilies #-}
module L.TypeCheck where

import Prelude hiding (lookup)
import qualified Data.Map as M
import Control.Monad.State
import Data.Maybe

import L.Abs
import qualified L.TAbs as T

data TCState = TCS { constructorTypes :: M.Map UIdent (Type, [Type])
                   , functionTypes    :: M.Map LIdent (Type, [Type])
                   , variableTypes    :: [M.Map LIdent Type] }

type TC a = StateT TCState (Either String) a

introduceC :: UIdent -> (Type, [Type]) -> TC ()
introduceC c t = do
  m <- gets constructorTypes
  case M.lookup c m of
    Nothing -> modify $ \s -> s { constructorTypes = M.insert c t m }
    Just _  -> typeError

introduceF :: LIdent -> (Type, [Type]) -> TC ()
introduceF f t = do
  m <- gets functionTypes
  case M.lookup f m of
    Nothing -> modify $ \s -> s { functionTypes = M.insert f t m }
    Just _  -> typeError

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

split :: Type -> (Type, [Type])
split (MonoType ui) = (MonoType ui, [])
split (FunType a r) =
  let (res, as) = split r in (res, a : as)

class TypeCheckable a where
  type Checked a :: *
  typeCheck :: Maybe Type -> a -> TC (Checked a)

instance TypeCheckable Decl where
  type Checked Decl = T.Decl
  typeCheck Nothing d = case d of
    DData n cs -> do
      sequence_ [ introduceC c (MonoType n, ts) | C c ts <- cs ]
      return $ T.DData n cs

    DFun f t f' xs e -> do
      unless (f == f') typeError
      unless (length xs <= (length . snd . split $ t)) typeError
      introduceF f (split t)
      push
      zipWithM_ introduce xs (snd (split t))
      (t', e') <- typeCheck Nothing e
      pop
      unless (t' == fst (split t)) typeError
      return $ T.DFun f t xs e'

    DThm t -> T.DThm <$> typeCheck Nothing t

instance TypeCheckable Thm where
  type Checked Thm = T.Thm
  typeCheck Nothing t = case t of
    TStandalone n p    -> T.TStandalone n <$> typeCheck Nothing p
    TUsing n p ns      -> flip (T.TUsing n) ns <$> typeCheck Nothing p
    TLemma n p         -> T.TLemma n <$> typeCheck Nothing p
    TLemmaUsing n p ns -> flip (T.TLemmaUsing n) ns <$> typeCheck Nothing p

instance TypeCheckable Proposition where
  type Checked Proposition = T.Proposition
  typeCheck Nothing p = case p of
    PForall vs t p -> do
      mapM_ (flip introduce t) vs
      T.PForall vs t <$> typeCheck Nothing p
    PEqual l r -> T.PEqual <$> (snd <$> typeCheck Nothing l) <*> (snd <$> typeCheck Nothing r)
    PExpr e -> T.PExpr . snd <$> typeCheck Nothing e

-- Binds variables in the current context
instance TypeCheckable Pat where
  type Checked Pat = T.Pat
  typeCheck t p = case p of
    PVar v    -> do
      Just t <- return t
      introduce v t
      return $ T.PVar v

    PCon c ps -> do
      (rt, argst) <- lookup constructorTypes c
      unless (Just rt == t) typeError
      unless (length ps == length argst) typeError
      T.PCon c <$> zipWithM typeCheck (map Just argst) ps 

instance TypeCheckable Expr where
  type Checked Expr = (Type, T.Expr)
  typeCheck _ e = case e of
    EVar v     -> do
      vt <- lookupVar v
      return (vt, T.EVar vt v)

    ECon c     -> do
      (rt, argst) <- lookup constructorTypes c
      unless (null argst) typeError
      return $ (rt, T.ECon rt c)

    EFApp f es -> do
      (rt, argst) <- lookup functionTypes f
      unless (length es == length argst) typeError
      at' <- mapM (typeCheck Nothing) es
      unless (map fst at' == argst) typeError
      return $ (rt, T.EFApp rt f (map snd at'))

    ECApp c es -> do
      (rt, argst) <- lookup constructorTypes c
      unless (length es == length argst) typeError
      at' <- mapM (typeCheck Nothing) es
      unless (map fst at' == argst) typeError
      return $ (rt, T.ECApp rt c (map snd at'))

    ECase e as -> do
      (et, e') <- typeCheck Nothing e
      as' <- sequence
        [ do push
             pat'    <- typeCheck (Just et) p
             (t, e') <- typeCheck Nothing e
             pop
             return $ (t, T.A pat' e')
        | A p e <- as ]
      unless (all ((==fst (head as')) . fst) as') typeError
      return (fst (head as'), T.ECase (fst (head as')) e' (map snd as'))
