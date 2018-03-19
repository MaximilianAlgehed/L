{-# LANGUAGE FlexibleInstances, TupleSections #-}
module L.Axiomatisation where

import GHC.Stack

import Control.Monad.State
import Control.Monad.Except
import qualified Data.Map as M
import Data.Maybe

import Twee hiding (goal)
import qualified Twee.Term as T
import Twee.Term hiding (Var, F)
import Twee.Base hiding (Var, F, Function)
import Twee.Equation
import qualified Twee.KBO

import L.CoreLanguage
import L.FunctionSymbols

apps :: (Term F, Type) -> [Term F] -> Term F
apps f ts = fst $ foldl (\(term, FunctionType _ typ) arg -> (typeTag typ $ build (app (fun (Function (Apply hideApply))) [term, arg]), typ)) f ts

apply :: Type -> F -> [Term F] -> Term F
apply resT f ts = case f of
  -- If it's a function pointer we need to sprinkle `$`s in the application
  Function (FPtr t typ) -> apps (t, typ) ts
  _ -> typeTag resT (build (app (fun f) ts))

data AState = S { nameMap       :: M.Map Name F
                , nameTypes     :: M.Map Name (Type, [Type])
                , variableMap   :: M.Map Name (Term F) 
                , variableTypes :: M.Map Name Type
                , definitions   :: M.Map Type [(Name, [Type])]
                , theorems      :: M.Map Name Proposition
                , nextVarId     :: Int
                , theory        :: [(String, Equation F)]
                }

type AM a = StateT AState (Either String) a

runAM :: AM a -> Either String a
runAM am = evalStateT am (S M.empty M.empty M.empty M.empty M.empty M.empty 0 [])

-- Introduce a new function symbol of a certain arity
-- to the context
addF :: Name -> Int -> AM ()
addF n i = modify $ \s -> s { nameMap = M.insert n (Function $ F i n False) (nameMap s) }

addT :: Name -> (Type, [Type]) -> AM ()
addT n t = modify $ \s -> s { nameTypes = M.insert n t (nameTypes s) }

addDef :: Type -> [(Name, [Type])] -> AM ()
addDef t d = modify $ \s -> s { definitions = M.insert t d (definitions s) }

addThm :: Name -> Proposition -> AM ()
addThm n p = modify $ \s -> s { theorems = M.insert n p (theorems s) }

getThm :: Name -> AM Proposition
getThm n = do
  thm <- gets theorems
  maybe (throwError "Unknown theorem") return (M.lookup n thm)

getF :: Name -> AM F
getF n = do
  -- Check if the function we are looking for is locally bound
  vm <- gets variableMap
  vt <- gets variableTypes
  case M.lookup n vm of
    -- Return a function pointer
    Just t -> return $ Function (FPtr t (fromJust (M.lookup n vt)))
    Nothing -> do
      -- Lookup the function symbol
      nm <- gets nameMap
      maybe (throwError "Unknown function symbol error") return (M.lookup n nm)

getT :: HasCallStack => Name -> AM (Type, [Type])
getT n = do
  vt <- gets variableTypes
  case M.lookup n vt of
    Just t -> return (splitCoreType t)
    Nothing -> do
      nt <- gets nameTypes
      maybe (throwError "Unknown type error") return (M.lookup n nt)

getDef :: Type -> AM [(Name, [Type])]
getDef t@(MonoType _) = do
  defs <- gets definitions
  maybe (throwError "Unknown definition error") return (M.lookup t defs)
getDef _ = return []

introduceV :: Name -> Type -> AM ()
introduceV n t = do
  id <- gets nextVarId 
  modify $ \s -> s { variableMap   = M.insert n (typeTag t . build . var . V $ id) (variableMap s)
                   , variableTypes = M.insert n t (variableTypes s)
                   , nextVarId     = id + 1 } 

freshVar :: Type -> AM (Term F)
freshVar t = do
  id <- gets nextVarId
  modify $ \s -> s { nextVarId = id + 1 }
  return (typeTag t . build . var . V $ id)

mapVarTo :: Name -> Term F -> AM ()
mapVarTo n t = modify $ \s -> s { variableMap = M.insert n t (variableMap s) }

specific :: Name -> Term F
specific = build . con . fun . Function . SFPtr 0 False

getV :: Name -> AM (Term F)
getV n = do
  vm <- gets variableMap
  case M.lookup n vm of
    Nothing -> do
      t <- getT n
      return (typeTag (foldr FunctionType (fst t) (snd t)) $ specific n)
    Just v  -> return v

resetV :: AM ()
resetV = modify $ \s -> s { variableMap   = M.empty
                          , nextVarId     = 0 }

freshSkolem :: Type -> AM (Term F)
freshSkolem t = do
  idx <- gets nextVarId
  modify $ \s -> s { nextVarId = idx + 1 }
  return . typeTag t . build . con . skolem . V $ idx

tt :: Term F -> Term F -> Term F
tt typ te = build (app (fun (Function (TT hideTypeTags))) [typ, te])

typeTag :: Type -> Term F -> Term F
typeTag = tt . (build . go)
  where
    go t@(MonoType _)       = con . fun . Function $ T t hideTypeTags
    go (FunctionType t0 t1) = app (fun $ Function (FT hideTypeTags)) $ [ go t0 , go t1 ]

exprToTerm :: HasCallStack => Expr -> AM (Term F)
exprToTerm e = case e of
  FApp n es -> do
    f <- getF n
    (tres, targs) <- getT n
    let t = foldr FunctionType tres (drop (length es) targs)
    es <- mapM exprToTerm es
    if length es == length targs then
      return $ apply tres f es
    else
      let typ = foldr FunctionType tres targs in
      case f of
        Function (FPtr f typ) -> return $ apps (f, typ) es
        _                     -> return $ apps (typeTag typ (specific n), typ) es

  Var n -> getV n

patternToTerm :: HasCallStack => Type -> Pattern -> AM (Term F)
patternToTerm t p = case p of
  ConstructorPattern n ps -> do
    f <- getF n
    (t, ts) <- getT n
    apply t f <$> zipWithM patternToTerm ts ps

  VariablePattern n -> do
    introduceV n t
    getV n

functionToEquations :: Decl -> AM [(String, Equation F)]
functionToEquations d = case d of
  FunDecl f@(Name fname) xs body -> do
    es <- case body of
            Case x ps -> sequence
                [ do resetV
                     (t, ts) <- getT f
                     sequence [ introduceV x t | (x, t) <- zip xs ts ]
                     f       <- getF f 
                     xs_     <- mapM getV xs
                     typ <- case [ t | (x', t) <- zip xs ts, x == x' ] of
                       []    -> throwError $ "Unkown variable error in case: " ++ show x
                       (t:_) -> return t
                     pat     <- patternToTerm typ pat
                     -- Replace the occurance of `x` with `pat` in the list of arguments
                     let xs' = [ if x == x_i then pat else x_t | (x_i, x_t) <- zip xs xs_ ]
                     e       <- exprToTerm expr
                     return $ ("def. " ++ fname, apply t f xs' :=: e)
                | (pat, expr) <- ps ]
  
            E e       -> do
              -- Reset the variable context
              resetV
              (t, ts) <- getT f
              sequence [ introduceV x t | (x, t) <- zip xs ts ]
              f  <- getF f
              xs <- mapM getV xs
              e  <- exprToTerm e
              return [("def. " ++ fname, apply t f xs :=: e)]
    resetV
    (t, ts) <- getT f
    sequence [ introduceV x t | (x, t) <- zip xs ts ]
    f'      <- getF f 
    xs_     <- mapM getV xs
    let typ = foldr FunctionType t ts
    let eq = ("apply " ++ fname, apps (typeTag typ (specific f), typ) xs_ :=: apply t f' xs_)
    return $ eq:es

  _ -> throwError "Argument to functionToEquations is not a function declaration"

proposition :: Proposition -> AM (Equation F)
proposition p = case p of
  Forall n t p -> do
    introduceV n t
    proposition p

  Equal e0 e1 -> do
    lhs <- exprToTerm e0
    rhs <- exprToTerm e1
    return (lhs :=: rhs)

  Implies e0 e1 p -> do
    e0 <- exprToTerm e0
    e1 <- exprToTerm e1
    lhs :=: rhs <- proposition p
    return $ build (app (fun (Function FIfEq)) [e0, e1, lhs, rhs]) :=: rhs

assume :: Name -> AM (String, Equation F)
assume n@(Name nm) = do
  thmDef <- getThm n
  (nm,) <$> proposition thmDef

axiomatise :: Program -> AM ()
axiomatise ps = do
  -- Introduce all defintions and constructors to the context
  sequence_ [ do
                -- Definitions
                addDef (MonoType t) cs
                -- Constructors
                sequence [ do addF n (length ts)
                              addT n (MonoType t, ts)
                         | (n, ts) <- cs ]
            | DataDecl t cs <- ps ]
  -- Introduce all functions to the context
  sequence_ [ addF n (length ns)
            | FunDecl n ns _ <- ps ]
  -- Introduce function types
  sequence_ [ addT n t
            | TypeDecl n t <- ps ] 
  -- Introduce all theorems to the context
  sequence_ [ addThm n p | TheoremDecl n p _ <- ps ]
  -- Compute axiomatisation from the functions
  axs <- concat <$> mapM functionToEquations [ f | f@(FunDecl _ _ _) <- ps ]
  -- Introduce the axiom for `IfEq`
  let eqAx = ("def. IfEq", build (app (fun (Function FIfEq)) (map var [ V 0, V 0, V 1, V 2 ])) :=: build (var (V 1)))
  modify $ \s -> s { theory = eqAx : axs }

data Problem = Problem { goal        :: Equation F
                       , antecedents :: [(String, Equation F)]
                       , hypotheses  :: [(String, Equation F)]
                       , lemmas      :: [(String, Equation F)]
                       , background  :: [(String, Equation F)] }

type InductionSchema = Proposition -> AM [Problem]

splitProposition :: Proposition -> ([(Name, Type)], [(Expr, Expr)], (Expr, Expr))
splitProposition p = case p of
  Forall n t p ->
    let (vt, antecs, lr) = splitProposition p in
    ((n, t) : vt, antecs, lr)

  Equal lhs rhs -> ([], [], (lhs, rhs))

  Implies e0 e1 p ->
    let (vt, antecs, lr) = splitProposition p in
    (vt, (e0, e1) : antecs, lr)


substEq s (l :=: r) = build (T.subst s l) :=: build (T.subst s r)

-- Generates an induction schema where the first variable in the proposition 
-- to be proven is of type `t` with definition `def`
structuralInduction :: Type -> [(Name, [Type])] -> InductionSchema
structuralInduction t def prop = do
  resetV
  let (vt, antecs, (lhs, rhs)) = splitProposition prop
  -- Introduce all the variables except for the one we are doing
  -- induction over (the first one)
  mapM (uncurry introduceV) $ drop 1 vt
  -- Introduce the fist type variable as just a variable
  idx <- gets nextVarId 
  modify $ \s -> s { nextVarId     = idx + 1 } 
  mapM (\n -> mapVarTo n (build . var $ V idx)) (fst <$> take 1 vt)
  -- The goal
  goal <- (:=:) <$> exprToTerm lhs <*> exprToTerm rhs
  -- All antecedents
  ants <- sequence [ (:=:) <$> exprToTerm lhs <*> exprToTerm rhs | (lhs, rhs) <- antecs ]
  -- The underlying theory
  thy <- gets theory
  sequence
    [ do
        -- One skolem variable for each recursive occurance of the type `t`
        -- and a normal variable otherwise
        vars <- sequence [ if t == t' then freshSkolem t' else freshVar t' | t' <- ts ]
        let skolems = [ v | (v, t') <- zip vars ts, t == t' ]
        -- Create I.H for each skolem variable
        let ihs = [ substEq (fromJust $ T.listToSubst [(V idx, sk)]) goal | sk <- skolems ]
        -- Get the constructor term
        c <- getF cn
        let term = apply t c vars
        -- Antecedents
        let antecs = substEq (con . skolem) . substEq (fromJust $ T.listToSubst [(V idx, term)]) <$> ants
        return $ Problem { goal = substEq (con . skolem) . substEq (fromJust $ T.listToSubst [(V idx, term)]) $ goal
                         , antecedents = [ ("antecedent " ++ show i, ant) | (i, ant) <- zip [0..] antecs]
                         , hypotheses = [ ("I.H. " ++ show i, substEq (\(V id) -> if id == idx then con (skolem (V id)) else var (V id)) ih) | (ih, i) <- zip ihs [0..] ]
                         , background = thy
                         , lemmas = [] }
    | (cn, ts) <- def ]

-- Do structural induction on the first argument
structInductOnFirst :: InductionSchema
structInductOnFirst prop =
  case splitProposition prop of
    ([], antecs, (lhs, rhs)) -> do
      -- The goal
      g <- (:=:) <$> exprToTerm lhs <*> exprToTerm rhs
      -- All antecedents
      ants <- sequence [ (:=:) <$> exprToTerm lhs <*> exprToTerm rhs ]
      -- The background
      thy <- gets theory
      -- skolemised antecedents 
      let antecs = [ ("antecedent " ++ show i, ant) | (i, ant) <- zip [0..] (substEq (con . skolem) <$> ants) ]
      -- skolemised goal
      let finalGoal = substEq (con . skolem) g
      return [Problem { goal = finalGoal, antecedents = antecs, background = thy, hypotheses = [], lemmas = [] }]
    ((_, t):_, _, _) -> do
      def <- getDef t
      structuralInduction t def prop

{- Function to test the induction schema generation -}
attack :: Name -> Program -> Either String [Problem]
attack n prg = runAM $ do
  axiomatise prg
  case [ (p, extras) | TheoremDecl n' p extras <- prg, n == n' ] of
    []    -> throwError "Can't attack a non-existent problem!"
    (p:_) -> do
      extras   <- mapM assume (snd p)
      problems <- structInductOnFirst (fst p)
      -- Add lemmas
      return [ p { lemmas = lemmas p ++ extras } | p <- problems ]
