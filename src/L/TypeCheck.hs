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

data TCState = TCS { constructorTypes :: M.Map UIdent Type
                   , variableTypes    :: [M.Map LIdent Type] }

type TC a = StateT TCState (Either String) a

runTC :: TC a -> Either String a
runTC tc = evalStateT tc (TCS M.empty [])

introduceC :: UIdent -> Type -> TC ()
introduceC c t = do
  m <- gets constructorTypes
  case M.lookup c m of
    Nothing -> modify $ \s -> s { constructorTypes = M.insert c t m }
    Just _  -> typeError 0

lookup :: (Ord a, Show a) => (TCState -> M.Map a t) -> a -> TC t
lookup f v = do
  ctx <- gets f
  maybe (fail $ "Unbound symbol " ++ show v) return (M.lookup v ctx)

lookupVar :: LIdent -> TC Type
lookupVar v = do
  ctx <- gets variableTypes
  case [ t | Just t <- M.lookup v <$> ctx ] of
    []    -> fail $ "Unbound variable: " ++ printTree v
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
  typeCheck Nothing (P ds) = T.P <$> (push >> sequence [ introduce f t | DFun f t _ _ _ <- ds] >> mapM (typeCheck Nothing) ds)

instance TypeCheckable Decl where
  type Checked Decl = T.Decl
  typeCheck Nothing d = case d of
    DData n cs -> do
      sequence_ [ introduceC c (foldr FunType (TypeApp n []) ts) | C c ts <- cs ]
      return $ T.DData n cs

    DFun f t f' xs e -> do
      unless (f == f') (typeError 6)
      unless (length xs <= (length . snd . T.split $ t)) (typeError 7)
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
    TStandalone n p    -> flip (T.TUsing n) [] . snd <$> typeCheck Nothing p
    TUsing n p ns      -> flip (T.TUsing n) ns . snd <$> typeCheck Nothing p
    TLemma n p         -> flip (T.TUsing n) [] . snd <$> typeCheck Nothing p
    TLemmaUsing n p ns -> flip (T.TUsing n) ns . snd <$> typeCheck Nothing p

true :: T.Expr
true = T.ECon bool (UIdent "True")

bool :: Type
bool = TypeApp (UIdent "Bool") []

-- Binds variables in the current context
instance TypeCheckable Pat where
  type Checked Pat = T.Pat
  typeCheck (Just t) p = case p of
    PVar v    -> do
      introduce v t
      return $ T.PVar t v
    
    PConE c -> do
      (rt, argst) <- T.split <$> lookup constructorTypes c
      unless (rt == t)
        (fail $ "Type error, expected type " ++ printTree t ++ " got " ++ printTree c ++ " : " ++ printTree rt)
      unless (null argst) (fail "Expected more arguments to constructor")
      return $ T.PCon c []{-FIXME-} []

    PCon c ps -> do
      (rt, argst) <- T.split <$> lookup constructorTypes c
      unless (rt == t) (typeError 9)
      unless (length ps == length argst) (typeError 10)
      T.PCon c []{-FIXME-} <$> zipWithM typeCheck (map Just argst) ps 

{- FIXME
 - * Implementaiton of polymorphic inference for function
 - applcation of a function with known type is the following:
 -
 -  - If a normal function is being applied we replace its
 -    type arguments with fresh variables and substitute the
 -    variables in the type of the function and unify all types
 -    and apply the resulting substitutions everywhere
 -
 -  - If we are applying an expression we compute the free
 -    type variables left after type inference for that expression
 -    and do a type application like described above.
 -}
instance TypeCheckable Expr where
  type Checked Expr = (Type, T.Expr)
  typeCheck _ e = case e of
    EVar v     -> do
      vt <- lookupVar v
      return (vt, T.EVar vt v)

    ECon c     -> do
      t <- lookup constructorTypes c
      return $ (t, T.ECon t c)

    EApp f es -> do
      (t, f') <- typeCheck Nothing f
      let (rt, argst) = T.split t
      unless (length es <= length argst) (typeError 12)
      at' <- mapM (typeCheck Nothing) es
      unless (and (zipWith (==) (map fst at') argst)) (typeError 13)
      let t' = foldr FunType rt (drop (length es) argst)
      return $ (t', T.EApp t' f' []{-FIXME-} (map snd at'))

    EEqual l r  -> do
      (tl, l) <- typeCheck Nothing l
      (tr, r) <- typeCheck Nothing r
      unless (tl == tr)    $ fail "Type mismatch on equality"
      when (tl == Formula) $ fail "Can't compare Formulas for equality"
      return (Formula, T.EEqual Formula l r) 

    EAll xs t e -> do
      push
      mapM_ (flip introduce t) xs
      (t', e) <- typeCheck Nothing e
      pop
      unless (t' == Formula) $ fail "Expected Formula result in forall"
      return (Formula, T.EAll Formula xs t e)

    EEx xs t e -> do
      push
      mapM_ (flip introduce t) xs
      (t', e) <- typeCheck Nothing e
      pop
      unless (t' == Formula) $ fail "Expected Formula result in exists"
      return (Formula, T.EEx Formula xs t e)

    EImpl l r e -> do
      (tl, l) <- typeCheck Nothing l
      (tr, r) <- typeCheck Nothing r
      unless (tl == tr) $ fail "Type mismatch on equality"
      when (tl == Formula) $ fail "Can't compare Formulas for equality"
      (te, e) <- typeCheck Nothing e
      unless (te == Formula) $ fail "Expected Formula result in implication"
      return (Formula, T.EImpl Formula l r e)

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

    ELam x t e -> do
      push
      introduce x t
      (et, e') <- typeCheck Nothing e
      pop
      return (FunType t et, T.ELam (FunType t et) []{-FIXME-} [x] e')

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
