{-# LANGUAGE TypeFamilies #-}
module L.TypeCheck where

import Twee.Term hiding (lookup)
import Prelude hiding (lookup)
import qualified Data.Map as M
import Control.Monad.State
import Data.Maybe

import L.Print
import L.Abs
import qualified L.TAbs as T

data TCState = TCS { constructorTypes :: M.Map UIdent (Type, [Type])
                   , functionTypes    :: M.Map LIdent (Type, [Type])
                   , variableTypes    :: [M.Map LIdent Type] }

type TC a = StateT TCState (Either String) a

runTC :: TC a -> Either String a
runTC tc = evalStateT tc (TCS M.empty M.empty [])

introduceC :: UIdent -> (Type, [Type]) -> TC ()
introduceC c t = do
  m <- gets constructorTypes
  case M.lookup c m of
    Nothing -> modify $ \s -> s { constructorTypes = M.insert c t m }
    Just _  -> typeError 0

introduceF :: LIdent -> (Type, [Type]) -> TC ()
introduceF f t = do
  m <- gets functionTypes
  case M.lookup f m of
    Nothing -> modify $ \s -> s { functionTypes = M.insert f t m }
    Just _  -> typeError 1

lookup :: (Ord a, Show a) => (TCState -> M.Map a t) -> a -> TC t
lookup f v = do
  ctx <- gets f
  maybe (fail $ "Unbound symbol " ++ show v) return (M.lookup v ctx)

lookupVar :: LIdent -> TC Type
lookupVar v = do
  ctx <- gets variableTypes
  case [ t | Just t <- M.lookup v <$> ctx ] of
    []    -> typeError 3
    (t:_) -> return t

push :: TC ()
push = modify $ \s -> s { variableTypes = M.empty : variableTypes s }

pop :: TC ()
pop = modify $ \s -> s { variableTypes = drop 1 (variableTypes s) }

introduce :: LIdent -> Type -> TC ()
introduce v t = do
  ctx <- gets variableTypes
  case ctx of
    []     -> typeError 4
    (m:ms) -> case M.lookup v m of
      Nothing -> modify $ \s -> s { variableTypes = M.insert v t m : ms }
      Just _  -> typeError 5

typeError :: Int -> TC a
typeError i = fail $ "Type error " ++ show i

class TypeCheckable a where
  type Checked a :: *
  typeCheck :: Maybe Type -> a -> TC (Checked a)

instance TypeCheckable Program where
  type Checked Program = T.Program
  typeCheck Nothing (P ds) = T.P <$> mapM (typeCheck Nothing) ds

instance TypeCheckable Decl where
  type Checked Decl = T.Decl
  typeCheck Nothing d = case d of
    DData n cs -> do
      sequence_ [ introduceC c (MonoType n, ts) | C c ts <- cs ]
      return $ T.DData n cs

    DFun f t f' xs e -> do
      unless (f == f') (typeError 6)
      unless (length xs <= (length . snd . T.split $ t)) (typeError 7)
      introduceF f (T.split t)
      push
      zipWithM_ introduce xs (snd (T.split t))
      (t', e') <- typeCheck Nothing e
      pop
      unless (t' == fst (T.split t)) (typeError 8)
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
      push
      mapM_ (flip introduce t) vs
      p <- T.PForall vs t <$> typeCheck Nothing p
      pop
      return p

    PEqual l r -> T.PEqual <$> (snd <$> typeCheck Nothing l) <*> (snd <$> typeCheck Nothing r)

    PExpr e -> T.PExpr . snd <$> typeCheck Nothing e

-- Binds variables in the current context
instance TypeCheckable Pat where
  type Checked Pat = T.Pat
  typeCheck (Just t) p = case p of
    PVar v    -> do
      introduce v t
      return $ T.PVar t v
    
    PConE c -> do
      (rt, argst) <- lookup constructorTypes c
      unless (rt == t)
        (fail $ "Type error, expected type " ++ printTree t ++ " got " ++ printTree c ++ " : " ++ printTree rt)
      unless (null argst) (fail "Expected more arguments to constructor")
      return $ T.PCon c []

    PCon c ps -> do
      (rt, argst) <- lookup constructorTypes c
      unless (rt == t) (typeError 9)
      unless (length ps == length argst) (typeError 10)
      T.PCon c <$> zipWithM typeCheck (map Just argst) ps 

instance TypeCheckable Expr where
  type Checked Expr = (Type, T.Expr)
  typeCheck _ e = case e of
    EVar v     -> do
      vt <- lookupVar v
      return (vt, T.EVar vt v)

    ECon c     -> do
      (rt, argst) <- lookup constructorTypes c
      unless (null argst) (typeError 11)
      return $ (rt, T.ECon rt c)

    EFApp f es -> do
      (rt, argst) <- lookup functionTypes f
      unless (length es == length argst) (typeError 12)
      at' <- mapM (typeCheck Nothing) es
      unless (map fst at' == argst) (typeError 13)
      return $ (rt, T.EFApp rt f (map snd at'))

    ECApp c es -> do
      (rt, argst) <- lookup constructorTypes c
      unless (length es == length argst) (typeError 14)
      at' <- mapM (typeCheck Nothing) es
      unless (map fst at' == argst) (typeError 15)
      return $ (rt, T.ECApp rt c (map snd at'))

    ECase e as -> do
      -- Check if patterns overlap
      unless (overlapsCheck [p | A p _ <- as] ) (fail "Overlapping patterns")
      (et, e') <- typeCheck Nothing e
      as' <- sequence
        [ do push
             pat'    <- typeCheck (Just et) p
             (t, e') <- typeCheck Nothing e
             pop
             return $ (t, T.A pat' e')
        | A p e <- as ]
      unless (all ((==fst (head as')) . fst) as') (typeError 16)
      return (fst (head as'), T.ECase (fst (head as')) e' (map snd as'))

overlapsCheck :: [Pat] -> Bool
overlapsCheck ps = all (\p -> [()] == [ () | Just _ <- match (toTerm p) . toTerm <$> ps]) ps

toTerm :: Pat -> Term String
toTerm p = evalState (go p) (M.empty, 0)
  where
    go :: Pat -> State (M.Map LIdent (Term String), Int) (Term String)
    go p = case p of
      PVar id -> do
        (m, idx) <- get
        case M.lookup id m of
          Nothing -> do
            let t = build . var . V $ idx
            put (M.insert id t m, idx + 1)
            return t
          Just t -> return t
      PConE (UIdent c) -> do
        return $ build (con (fun c))
      PCon (UIdent c) ps -> build . app (fun c) <$> mapM go ps
