{-# LANGUAGE FlexibleInstances #-}
module L.Axiomatisation where

import Control.Monad.State
import Control.Monad.Except
import qualified Data.Map as M

import Twee
import qualified Twee.Term as T
import Twee.Term hiding (Var, F)
import Twee.Base hiding (Var, F)
import Twee.Equation
import qualified Twee.KBO

import L.CoreLanguage

data FI = F { arityF :: Int
            , nameF  :: Name
            }
        | T { arityF :: Int
            , typ    :: Type }
        deriving (Ord, Eq, Show)

instance Sized FI where
  size _ = 1

instance Arity FI where
  arity = arityF

instance Pretty FI where
  pPrint f@(F _ _)= text . show . nameF $ f
  pPrint t@(T _ _)= text . ("tt" ++ ) . show . typ   $ t

instance EqualsBonus FI where

instance PrettyTerm FI where

instance Ordered (Extended FI) where
   lessEq = Twee.KBO.lessEq
   lessIn = Twee.KBO.lessIn

type F = Extended FI

apply :: F -> [Term F] -> Term F
apply f ts = build (app (fun f) ts)

data AState = S { nameMap       :: M.Map Name F
                , nameTypes     :: M.Map Name (Type, [Type])
                , variableMap   :: M.Map Name (Term F) 
                , nextVarId     :: Int
                }

type AM a = StateT AState (Either String) a

runAM :: AM a -> Either String a
runAM am = evalStateT am (S M.empty M.empty M.empty 0)

-- Introduce a new function symbol of a certain arity
-- to the context
addF :: Name -> Int -> AM ()
addF n i = modify $ \s -> s { nameMap = M.insert n (Function $ F i n) (nameMap s) }

addT :: Name -> (Type, [Type]) -> AM ()
addT n t = modify $ \s -> s { nameTypes = M.insert n t (nameTypes s) }

getF :: Name -> AM F
getF n = do
  nm <- gets nameMap
  maybe (throwError "Unkown constructor error") return (M.lookup n nm)

getT :: Name -> AM (Type, [Type])
getT n = do
  nt <- gets nameTypes
  maybe (throwError "Unkown type error") return (M.lookup n nt)

getTRes :: Name -> AM Type
getTRes n = fst <$> getT n

getTArg :: Name -> AM [Type]
getTArg n = snd <$> getT n

introduceV :: Name -> Type -> AM ()
introduceV n t = do
  id <- gets nextVarId 
  modify $ \s -> s { variableMap   = M.insert n (typeTag t . build . var $ V id) (variableMap s)
                   , nextVarId     = id + 1 } 

getV :: Name -> AM (Term F)
getV n = do
  vm <- gets variableMap
  case M.lookup n vm of
    Nothing -> throwError $ "Unkown variable error: " ++ show n
    Just v -> return v

resetV :: AM ()
resetV = modify $ \s -> s { variableMap   = M.empty
                          , nextVarId     = 0 }

typeTag :: Type -> Term F -> Term F
typeTag t tm = apply (Function (T 1 t)) [tm]

exprToTerm :: Expr -> AM (Term F)
exprToTerm e = case e of
  FApp n es -> do
    f <- getF n
    t <- getTRes n
    typeTag t . apply f <$> mapM exprToTerm es

  CApp n es -> do
    f <- getF n
    t <- getTRes n
    typeTag t . apply f <$> mapM exprToTerm es

  Var n -> getV n

patternToTerm :: Type -> Pattern -> AM (Term F)
patternToTerm t p = case p of
  ConstructorPattern n ps -> do
    f <- getF n
    (t, ts) <- getT n
    typeTag t . apply f <$> zipWithM patternToTerm ts ps

  VariablePattern n -> do
    introduceV n t
    getV n

functionToEquations :: Decl -> AM [Equation F]
functionToEquations d = case d of
  FunDecl f xs body -> case body of
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
             let xs' = [ if x /= x_i then x_t else pat | (x_i, x_t) <- zip xs xs_ ]
             e       <- exprToTerm expr
             return $ typeTag t (apply f xs') :=: e
        | (pat, expr) <- ps ]
  
    E e       -> do
      -- Reset the variable context
      resetV
      (t, ts) <- getT f
      sequence [ introduceV x t | (x, t) <- zip xs ts ]
      f  <- getF f
      xs <- mapM getV xs
      e  <- exprToTerm e
      return [typeTag t (apply f xs) :=: e]

  _ -> throwError "Argument to functionToEquations is not a function declaration"

axiomatise :: Program -> AM [Equation F]
axiomatise ps = do
  -- Introduce all constructors to the context
  sequence_ [ do addF n (length ts)
                 addT n (MonoType t, ts)
            | DataDecl t cs <- ps
            , (n, ts) <- cs]
  -- Introduce all functions to the context
  sequence_ [ addF n (length ns)
            | FunDecl n ns _ <- ps ]
  -- Introduce function types
  sequence_ [ addT n t
            | TypeDecl n t <- ps ] 
  -- Compute axiomatisation from the functions
  concat <$> mapM functionToEquations [ f | f@(FunDecl _ _ _) <- ps ]
