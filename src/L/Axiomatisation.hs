{-# LANGUAGE FlexibleInstances, TupleSections #-}
module L.Axiomatisation where

import GHC.Stack

import Control.Monad.State
import Control.Monad.Except
import qualified Data.Map as M
import Data.Maybe
import Data.List

import Twee hiding (goal)
import qualified Twee.Term as T
import Twee.Term hiding (Var, F, subst)
import Twee.Base hiding (Var, F, Function)
import Twee.Equation
import qualified Twee.KBO

import L.CoreLanguage
import L.FunctionSymbols
import qualified L.Eval as E

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
                , funDefs       :: M.Map Name ([Name], Body)
                , nextVarId     :: Int
                , nextExId      :: Int
                , theory        :: [(String, Equation F)]
                }

type AM a = StateT AState (Either String) a

runAM :: AM a -> Either String a
runAM am = evalStateT am (S M.empty M.empty M.empty M.empty M.empty M.empty M.empty 0 0 [])

-- Introduce a new function symbol of a certain arity
-- to the context
addF :: Name -> Int -> AM ()
addF n i = modify $ \s -> s { nameMap = M.insert n (Function $ F i n False) (nameMap s) }

addT :: Name -> (Type, [Type]) -> AM ()
addT n t = modify $ \s -> s { nameTypes = M.insert n t (nameTypes s) }

addDDef :: Type -> [(Name, [Type])] -> AM ()
addDDef t d = modify $ \s -> s { definitions = M.insert t d (definitions s) }

addDef :: Name -> ([Name], Body) -> AM ()
addDef n p = modify $ \s -> s { funDefs = M.insert n p (funDefs s) }

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
      maybe (throwError $ "Unknown function symbol error: " ++ show n) return (M.lookup n nm)

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

introduceSk :: Name -> Type -> AM ()
introduceSk n t = do
  id <- gets nextVarId
  modify $ \s -> s { variableMap   = M.insert n (typeTag t . build . con . skolem . V $ id) (variableMap s)
                   , variableTypes = M.insert n t (variableTypes s)
                   , nextVarId     = id + 1 } 

introduceEx :: Name -> Type -> AM ()
introduceEx n t = do
  id <- gets nextExId 
  modify $ \s -> s { variableMap   = M.insert n (typeTag t . build . con . fun . Existential . V $ id) (variableMap s)
                   , variableTypes = M.insert n t (variableTypes s)
                   , nextExId      = id + 1 } 

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
functionToEquations d = do
  case d of
    FunDecl f@(Name fname) t xs body -> do
      es <- case body of
              Case x ps -> sequence
                  [ do modify $ \s -> s { nextVarId = 0 }
                       (t, ts) <- getT f
                       sequence [ introduceV x t | (x, t) <- zip xs ts ]
                       f       <- getF f 
                       xs_     <- mapM getV xs
                       typ <- case [ t | (x', t) <- zip xs ts, x == x' ] of
                         []    -> throwError $ "Unknown variable error in case: " ++ show x
                         (t:_) -> return t
                       pat     <- patternToTerm typ pat
                       -- Replace the occurance of `x` with `pat` in the list of arguments
                       let xs' = [ if x == x_i then pat else x_t | (x_i, x_t) <- zip xs xs_ ]
                       e       <- exprToTerm expr
                       return $ ("def. " ++ fname, apply t f xs' :=: e)
                  | (pat, expr) <- ps ]
    
              E e       -> do
                -- Reset the variable context
                (t, ts) <- getT f
                sequence [ introduceV x t | (x, t) <- zip xs ts ]
                f   <- getF f
                xs' <- mapM getV xs
                e   <- exprToTerm e
                return [("def. " ++ fname, apply t f xs' :=: e)]
      modify $ \s -> s { nextVarId = 0 }
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

  Exists n t p -> do
    introduceEx n t
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
  modify $ \s -> s { nextVarId = 0 }
  thmDef <- getThm n
  p <- normaliseProp thmDef >>= proposition
  return (nm, p)

axiomatise :: Program -> AM ()
axiomatise ps = do
  -- Introduce all defintions and constructors to the context
  sequence_ [ do
                -- Definitions
                addDDef (MonoType t) cs
                -- Constructors
                sequence [ do addF n (length ts)
                              addT n (MonoType t, ts)
                         | (n, ts) <- cs ]
            | DataDecl t cs <- ps ]
  -- Introduce all functions to the context
  sequence_ [ addF n (length ns) >> addT n (splitCoreType t) >> addDef n (ns, body)
            | FunDecl n t ns body <- ps ]
  -- Introduce all theorems to the context
  sequence_ [ addThm n p | TheoremDecl n p _ <- ps ]
  -- Compute axiomatisation from the functions
  axs <- concat <$> mapM functionToEquations [ f | f@(FunDecl _ t _ _) <- ps, fst (splitCoreType t) /= Formula ]
  -- Introduce the axiom for `IfEq`
  let eqAx = ("def. IfEq", build (app (fun (Function FIfEq)) (map var [ V 0, V 0, V 1, V 2 ])) :=: build (var (V 1)))
  let eqlAx = ("def. (==)", build (app (fun (Function F_equals)) (map var [V 0, V 0])) :=: (build . con . fun . Function $ F_true))
  modify $ \s -> s { theory = eqlAx : eqAx : axs }

-- | Partially evaluate a proposition to get it
-- into "application-free" form
normaliseProp :: Proposition -> AM Proposition
normaliseProp p = do
  ds <- gets funDefs
  lift . E.runEval ds . E.normaliseProp $ p

data Problem = Problem { goal        :: Equation F
                       , antecedents :: [(String, Equation F)]
                       , hypotheses  :: [(String, Equation F)]
                       , lemmas      :: [(String, Equation F)]
                       , background  :: [(String, Equation F)] }

type InductionSchema = Proposition -> AM [Problem]

splitProposition :: Proposition -> AM ([Equation F], Equation F, (Term F, Term F))
splitProposition p = do
  as <- produceAntecs p
  vm <- gets variableMap
  ih <- produceIH p
  modify $ \s -> s { variableMap = vm }
  g  <- produceGoal p
  return (as, ih, g)
  where
    produceAntecs :: Proposition -> AM [Equation F]
    produceAntecs = go []
      where
        go as p = case p of
          Forall n t p -> do
            introduceSk n t
            go as p
    
          Exists n t p -> do
            introduceEx n t
            go as p
    
          Equal _ _ -> return as
    
          Implies e0 e1 p -> do
            l <- exprToTerm e0 
            r <- exprToTerm e1
            go ((l :=: r) : as) p
    
    produceGoal :: Proposition -> AM (Term F, Term F)
    produceGoal p = case p of
      Forall n t p -> produceGoal p
    
      Exists n t p -> do
        introduceV n t
        produceGoal p
    
      Equal l r -> do
        l <- exprToTerm l
        r <- exprToTerm r
        return (l, r)
    
      Implies _ _ p -> produceGoal p 

    produceIH :: Proposition -> AM (Equation F)
    produceIH p = case p of
      Forall n t p -> do
        introduceV n t
        produceIH p
    
      Exists n t p -> produceIH p
    
      Equal l r -> do
        l <- exprToTerm l
        r <- exprToTerm r
        return (l :=: r)
    
      Implies _ _ p -> produceIH p 

hasExists :: Proposition -> Bool
hasExists p = case p of
  Forall _ _ p  -> hasExists p
  Exists _ _ _  -> True
  Implies _ _ p -> hasExists p
  Equal _ _     -> False

substEq s (l :=: r) = build (T.subst s l) :=: build (T.subst s r)

-- Generates an induction schema where the first variable in the proposition 
-- to be proven is of type `t` with definition `def`
structuralInduction :: Type -> [(Name, [Type])] -> InductionSchema
structuralInduction t def (Forall n _ prop) = do
  -- Introduce the fist type variable as just a variable
  let idx = 0
  modify $ \s -> s { nextVarId = 1 } 
  mapVarTo n (build . var $ V idx)
  -- Split the proposition to get the antecedens
  (ants, ih, (l, r)) <- splitProposition prop
  let goal = build (app (fun (Function F_equals)) [l, r]) :=: (build . con . fun . Function $ F_false)
  -- Introduce all the variables except for the one we are doing
  thy <- gets theory
  sequence
    [ do
        -- One skolem variable for each recursive occurance of the type `t`
        -- and a normal variable otherwise
        vars <- sequence [ if t == t' then freshSkolem t' else freshVar t' | t' <- ts ]
        let skolems = [ v | (v, t') <- zip vars ts, t == t' ]
        -- Create I.H for each skolem variable
        let ihs = [ substEq (fromJust $ T.listToSubst [(V idx, sk)]) ih | sk <- skolems ]
        -- Get the constructor term
        c <- getF cn
        let term = apply t c vars
        -- Antecedents
        let antecs = substEq (con . skolem) . substEq (fromJust $ T.listToSubst [(V idx, term)]) <$> ants
        return $ Problem { goal = if hasExists prop then (build . con . fun . Function $ F_true) :=: (build . con . fun . Function $ F_false)
                                                    else substEq (con . skolem) . substEq (fromJust $ T.listToSubst [(V idx, subst (con . skolem) term)]) $ ih
                         , antecedents = [ ("antecedent " ++ show i, ant) | (i, ant) <- zip [0..] antecs]
                         , hypotheses =  [ ("I.H. " ++ show i, substEq (\(V id) -> if id == idx then con (skolem (V id)) else var (V id)) ih) | (ih, i) <- zip ihs [0..] ]
                                      ++ if hasExists prop then [ ("Negated goal", substEq (fromJust $ T.listToSubst [(V idx, subst (con . skolem) term)]) $ goal) ]
                                         else []
                         , background = thy
                         , lemmas = [] }
    | (cn, ts) <- def ]

-- Do structural induction on the first argument
structInductOnFirst :: InductionSchema
structInductOnFirst prop = do
  prop <- normaliseProp prop
  case prop of
    Forall _ t _ -> do
      def <- getDef t
      structuralInduction t def prop

    _ -> withoutInduction prop 

withoutInduction :: InductionSchema
withoutInduction prop = do
  prop <- normaliseProp prop
  (ants, ih, (l, r)) <- splitProposition prop
  let antecs = [ ("antecedent " ++ show i, ant) | (i, ant) <- zip [0..] ants ]
  thy <- gets theory
  let prob = if hasExists prop then
                  [ Problem { goal = (build . con . fun . Function $ F_true) :=: (build . con . fun . Function $ F_false)
                            , antecedents = antecs
                            , background = thy
                            , hypotheses = [ ("Negated goal", build (app (fun (Function F_equals)) [l, r]) :=: (build . con . fun . Function $ F_false))]
                            , lemmas = [] } ]
             else
                  [ Problem { goal = substEq (con . skolem) ih
                            , antecedents = antecs
                            , background = thy
                            , hypotheses = []
                            , lemmas = [] } ]
  return prob

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
