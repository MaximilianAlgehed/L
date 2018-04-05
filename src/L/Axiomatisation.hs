{-# LANGUAGE FlexibleInstances, TupleSections #-}
module L.Axiomatisation where

{- FIXME:
 - * Make sure the arity of a function
 -   includes the type arguments
 -}

import GHC.Stack
import Debug.Trace

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
apps f ts = fst $ foldl (\(term, FunctionType _ typ) arg -> (typeTag typ $ build (app (fun (Function (Apply hideApply))) [term, arg]), typ))
                            f ts 

apply :: Type -> F -> [Type] -> [Term F] -> Term F
apply resT f types ts = case f of
  -- If it's a function pointer we need to sprinkle `$`s in the application
  Function (FPtr t typ) -> apps (build $ app (fun (Function $ TypeApply (length types + 1) hideApply)) (t:map typeToTerm types), typ) ts
  _ -> typeTag resT (build (app (fun f) $ (typeToTerm <$> types) ++ ts))

data AState = S { nameMap       :: M.Map Name F
                , nameTypes     :: M.Map Name (Type, [Type], [Name])
                , variableMap   :: M.Map Name (Term F) 
                , variableTypes :: M.Map Name Type
                , typeVarMap    :: M.Map Name (Term F)
                , definitions   :: M.Map Name ([Name], [(Name, [Type])])
                , theorems      :: M.Map Name Proposition
                , funDefs       :: M.Map Name ([Name], [Name], Body)
                , nextVarId     :: Int
                , nextExId      :: Int
                , theory        :: [(String, Equation F)]
                }

type AM a = StateT AState (Either String) a

runAM :: AM a -> Either String a
runAM am = evalStateT am (S M.empty M.empty M.empty M.empty M.empty M.empty M.empty M.empty 0 0 [])

-- Introduce a new function symbol of a certain arity
-- to the context
addF :: Name -> Int -> AM ()
addF n i = modify $ \s -> s { nameMap = M.insert n (Function $ F i n False) (nameMap s) }

addT :: Name -> ((Type, [Type]), [Name]) -> AM ()
addT n ((ty, ts), ns) = let t = (ty, ts, ns) in modify $ \s -> s { nameTypes = M.insert n t (nameTypes s) }

addDDef :: Name -> ([Name], [(Name, [Type])]) -> AM ()
addDDef t d = modify $ \s -> s { definitions = M.insert t d (definitions s) }

addDef :: Name -> ([Name], [Name], Body) -> AM ()
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

getT :: HasCallStack => Name -> AM (Type, [Type], [Name])
getT n = do
  vt <- gets variableTypes
  case M.lookup n vt of
    Just t -> let (ty, ts) = splitCoreType t in return (ty, ts, ftv t)
    Nothing -> do
      nt <- gets nameTypes
      maybe (throwError "Unknown type error") return (M.lookup n nt)

getDef :: Name -> AM ([Name], [(Name, [Type])])
getDef n = do
  defs <- gets definitions
  maybe (throwError "Unknown definition error") return (M.lookup n defs)

introduceV :: Name -> Type -> AM ()
introduceV n t = do
  id <- gets nextVarId 
  modify $ \s -> s { variableMap   = M.insert n (typeTag t . build . var . V $ id) (variableMap s)
                   , variableTypes = M.insert n t (variableTypes s)
                   , nextVarId     = id + 1 } 

introduceTV :: Name -> AM ()
introduceTV n = do
  id <- gets nextVarId
  modify $ \s -> s { typeVarMap = M.insert n (build . var . V $ id) (typeVarMap s)
                   , nextVarId  = id + 1 }

introduceSk :: Name -> Type -> AM ()
introduceSk n t = do
  id <- gets nextVarId
  modify $ \s -> s { variableMap   = M.insert n (typeTag t . build . con . skolem . V $ id) (variableMap s)
                   , variableTypes = M.insert n t (variableTypes s)
                   , nextVarId     = id + 1 } 

introduceEx :: [Name] -> Name -> Type -> AM ()
introduceEx xs n t = do
  id <- gets nextExId
  ts <- mapM getV xs
  modify $ \s -> s { variableMap   = M.insert n (typeTag t . build $ app (fun (Function (Skf id (length xs)))) ts) (variableMap s)
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
specific = build . con . fun . Function . SFPtr False

getV :: Name -> AM (Term F)
getV n = do
  vm <- gets variableMap
  case M.lookup n vm of
    Nothing -> do
      (t, ts, _) <- getT n
      return (typeTag (foldr FunctionType t ts) $ specific n)
    Just v  -> return v

freshSkolem :: Type -> AM (Term F)
freshSkolem t = do
  idx <- gets nextExId 
  modify $ \s -> s { nextExId = idx + 1 }
  return . typeTag t . build . con . fun . Function $ Skf idx 0

tt :: Term F -> Term F -> Term F
tt typ te = build (app (fun (Function (TT hideTypeTags))) [typ, te])

typeTag :: Type -> Term F -> Term F
typeTag = tt . (build . go)
  where
    go t@(TypeApp n ts)     = app (fun $ Function (T n (length ts) hideTypeTags)) (map go ts)
    go (FunctionType t0 t1) = app (fun $ Function (FT hideTypeTags)) [ go t0 , go t1 ]

{- FIXME: This needs to be in a context where free variables can be
 - looked up in the context -}
typeToTerm :: HasCallStack => Type -> Term F
typeToTerm = undefined

exprToTerm :: HasCallStack => Expr -> AM (Term F)
exprToTerm e = case e of
  FApp n ts es -> do
    f <- getF n
    (tres_, targs_, ns) <- getT n
    let ss    = zip ns ts
    let tres  = substTypeList tres_ ss
    let targs = map (flip substTypeList ss) targs
    let t = foldr FunctionType tres (drop (length es) targs)
    es <- mapM exprToTerm es
    if length es == length targs then
      return $ apply tres f ts es
    else
      let typ = foldr FunctionType tres targs in
      case f of
        Function (FPtr f typ) -> do
          let fptr = build $ app (fun (Function (TypeApply (length ts + 1) hideTypeTags))) (f : map typeToTerm ts)
          return $ apps (fptr, typ) es
        _ -> do
          let fptr = build $ app (fun (Function (TypeApply (length ts + 1) hideTypeTags))) (typeTag typ (specific n) : map typeToTerm ts)
          return $ apps (fptr, typ) es

  Var n -> getV n 

patternToTerm :: HasCallStack => Type -> Pattern -> AM (Term F)
patternToTerm t p = case p of
  ConstructorPattern n ts ps -> do
    f <- getF n
    (t, ts, _) <- getT n
    apply t f ts <$> zipWithM patternToTerm ts ps

  VariablePattern n -> do
    introduceV n t
    getV n

functionToEquations :: Decl -> AM [(String, Equation F)]
functionToEquations d = do
  -- Reset the variable context
  modify $ \s -> s { variableMap = M.empty, nextVarId = 0 }
  case d of
    FunDecl f@(Name fname) t ts xs body -> do
      es <- case body of
              Case x ps -> sequence
                  [ do modify $ \s -> s { variableMap = M.empty, nextVarId = 0 }
                       (t, ts, _) <- getT f
                       sequence [ introduceV x t | (x, t) <- zip xs ts ]
                       f <- getF f 
                       xs_     <- mapM getV xs
                       typ <- case [ t | (x', t) <- zip xs ts, x == x' ] of
                         []    -> throwError $ "Unknown variable error in case: " ++ show x
                         (t:_) -> return t
                       pat     <- patternToTerm typ pat
                       -- Replace the occurance of `x` with `pat` in the list of arguments
                       let xs' = [ if x == x_i then pat else x_t | (x_i, x_t) <- zip xs xs_ ]
                       e       <- exprToTerm expr
                       return $ ("def. " ++ fname, apply t f ts xs' :=: e)
                  | (pat, expr) <- ps ]
    
              E e       -> do
                (t, ts, _) <- getT f
                sequence [ introduceV x t | (x, t) <- zip xs ts ]
                f  <- getF f
                xs' <- mapM getV xs
                e   <- exprToTerm e
                return [("def. " ++ fname, apply t f ts xs' :=: e)]

      modify $ \s -> s { variableMap = M.empty, nextVarId = 0 }
      (t, ts, _) <- getT f
      sequence [ introduceV x t | (x, t) <- zip xs ts ]
      f' <- getF f 
      xs_     <- mapM getV xs
      let typ = foldr FunctionType t ts
      let fptr = build $ app (fun (Function (TypeApply (length ts + 1) hideTypeTags))) (typeTag typ (specific f) : map typeToTerm ts)
      let eq = ("apply " ++ fname, apps (fptr, typ) xs_ :=: apply t f' ts xs_)
      return $ eq:es

    _ -> throwError "Argument to functionToEquations is not a function declaration"

assume :: Name -> AM [(String, Equation F)]
assume n@(Name nm) = do
  modify $ \s -> s { nextVarId = 0 }
  thmDef <- getThm n
  ps <- normaliseProp thmDef >>= axioms
  if length ps == 1 then
    return [(nm, head ps)]
  else
    return [ (nm ++ show i, p) | (i, p) <- zip [0..] ps ]

addCPtrAxiom :: Name -> Type -> [Type] -> AM ()
addCPtrAxiom (Name n) t ts = do
  modify $ \s -> s { nextVarId = 0 }
  let typ = foldr FunctionType t ts
  xs <- mapM freshVar ts
  f' <- getF (Name n)
  let fptr = build $ app (fun (Function (TypeApply (length ts + 1) hideTypeTags))) (typeTag typ (specific (Name n)) : map typeToTerm ts)
  modify $ \s -> s { theory = ("apply " ++ n, apps (fptr, typ) xs :=: apply t f' ts xs) : theory s }

axiomatise :: Program -> AM ()
axiomatise ps = do
  -- Introduce all defintions and constructors to the context
  sequence_ [ do
                -- Definitions
                addDDef t (targs, cs)
                -- Constructors
                sequence [ do addF n (length ts)
                              addT n ((TypeApp t (TypeVar <$> targs), ts), targs)
                              unless (null ts) $ addCPtrAxiom n (TypeApp t (TypeVar <$> targs)) ts
                         | (n, ts) <- cs ]
            | DataDecl t targs cs <- ps ]
  -- Introduce all functions to the context
  sequence_ [ addF n (length ts + length ns) >> addT n (splitCoreType t, ts) >> addDef n (ts, ns, body)
            | FunDecl n t ts ns body <- ps ]
  -- Introduce all theorems to the context
  sequence_ [ addThm n p | TheoremDecl n p _ <- ps ]
  -- Compute axiomatisation from the functions
  axs <- concat <$> mapM functionToEquations [ f | f@(FunDecl _ t _ _ _) <- ps, fst (splitCoreType t) /= Formula ]
  -- Introduce the axiom for `IfEq`
  let eqAx = ("def. IfEq", build (app (fun (Function FIfEq)) (map var [ V 0, V 0, V 1, V 2 ])) :=: build (var (V 1)))
  let eqlAx = ("def. (==)", build (app (fun (Function F_equals)) (map var [V 0, V 0])) :=: true)
  modify $ \s -> s { theory = eqlAx : eqAx : axs ++ theory s }

-- | Partially evaluate a proposition to get it
-- into "application-free" form
normaliseProp :: Proposition -> AM Proposition
normaliseProp p = do
  ds <- gets funDefs
  lift . E.runEval ds . E.normaliseProp $ p

data Problem = Problem { goal        :: Equation F
                       , hypotheses  :: [(String, Equation F)]
                       , lemmas      :: [(String, Equation F)]
                       , background  :: [(String, Equation F)] }

type InductionSchema = Proposition -> AM [Problem]

axioms :: Proposition -> AM [Equation F]
axioms p = go [] p
  where
    go as p = case p of
      Forall n t p -> do
        introduceV n t
        go (n:as) p
      Exists n t p -> do
        introduceEx as n t
        go as p
      Equal l r -> do
        l <- exprToTerm l
        r <- exprToTerm r
        return [l :=: r]
      NotEqual l r -> do
        l <- exprToTerm l
        r <- exprToTerm r
        return [build (app (fun (Function F_equals)) [l, r]) :=: false]
      Implies e0 e1 p -> do
        e0 <- exprToTerm e0
        e1 <- exprToTerm e1
        axs <- go as p
        return [ build (app (fun (Function FIfEq)) [e0, e1, lhs, rhs]) :=: rhs | lhs :=: rhs <- axs ]
      And p q -> (++) <$> go as p <*> go as q
      ForallType n p -> do
        introduceTV n
        go as p

hasExists :: Proposition -> Bool
hasExists p = case p of
  Forall _ _ p   -> hasExists p
  Exists _ _ _   -> True
  Implies _ _ p  -> hasExists p
  Equal _ _      -> False
  NotEqual _ _   -> False
  And p q        -> hasExists p || hasExists q
  ForallType _ p -> hasExists p

substEq s (l :=: r) = build (T.subst s l) :=: build (T.subst s r)

false, true :: Term F
false = (build . con . fun . Function $ F_false)
true  = (build . con . fun . Function $ F_true)

-- Generates an induction schema where the first variable in the proposition 
-- to be proven is of type `t` with definition `def`
structuralInduction :: InductionSchema
structuralInduction (Forall n t@(TypeApp tn typeArgs) prop) = do
  (argNames, def) <- getDef tn
  -- Introduce the fist type variable as just a variable
  let idx = 0
  modify $ \s -> s { nextVarId = 1 } 
  mapVarTo n (build . var $ V idx)
  -- Split the proposition to get the antecedens
  [ih] <- axioms prop
  negs <- axioms (negatedNFP prop)
  -- Introduce all the variables except for the one we are doing
  thy <- gets theory
  traceM (show prop)
  sequence
    [ do
        let ts = flip substTypeList (zip argNames typeArgs) <$> tsIn
        -- One skolem variable for each recursive occurance of the type `t`
        -- and a normal variable otherwise
        vars <- sequence [ if t == t' then freshSkolem t' else freshVar t'
                         | t' <- ts ]
        let skolems = [ v | (v, t') <- zip vars ts, t == t' ]
        -- Create I.H for each skolem variable
        let ihs = [ substEq (fromJust $ T.listToSubst [(V idx, sk)]) ih | sk <- skolems ]
        -- Get the constructor term
        c <- getF cn
        let term = apply t c ts vars
        return $ Problem { goal = true :=: false 
                         , hypotheses  = [ ("I.H. " ++ show i, substEq (\(V id) -> if id == idx then con (skolem (V id)) else var (V id)) ih)
                                         | (ih, i) <- zip ihs [0..] ]
                                      ++ [ ("Negated Goal " ++ show i, substEq (fromJust $ T.listToSubst [(V idx, subst (con . skolem) term)]) $ g)
                                         | (i, g) <- zip [0..] negs ]
                         , background = thy
                         , lemmas = [] }
    | (cn, tsIn) <- def ]

-- Do structural induction on the first argument
structInductOnFirst :: InductionSchema
structInductOnFirst prop = do
  prop <- normaliseProp prop
  case prop of
    Forall _ _ _ -> structuralInduction prop

    _ -> withoutInduction prop 

withoutInduction :: InductionSchema
withoutInduction prop = do
  prop   <- normaliseProp prop
  fromGoal <- axioms (negatedNFP prop)
  thy <- gets theory
  return [ Problem { goal = true :=: false
                   , background = thy
                   , hypotheses = [ ("Goal Assumption " ++ show i, p) | (i, p) <- zip [0..] fromGoal ]
                   , lemmas = [] } ]

{- Function to test the induction schema generation -}
attack :: InductionSchema -> Name -> Program -> Either String [Problem]
attack induct n prg = runAM $ do
  axiomatise prg
  case [ (p, extras) | TheoremDecl n' p extras <- prg, n == n' ] of
    []    -> throwError "Can't attack a non-existent problem!"
    (p:_) -> do
      extras   <- mapM assume (snd p)
      problems <- induct (fst p)
      -- Add lemmas
      return [ p { lemmas = lemmas p ++ concat extras } | p <- problems ]
