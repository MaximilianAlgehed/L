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
            } deriving (Ord, Eq, Show)

instance Sized FI where
  size _ = 1

instance Arity FI where
  arity = arityF

instance Pretty FI where
  pPrint = text . show . nameF

instance EqualsBonus FI where

instance PrettyTerm FI where

instance Ordered (Extended FI) where
   lessEq = Twee.KBO.lessEq
   lessIn = Twee.KBO.lessIn

type F = Extended FI

apply :: F -> [Term F] -> Term F
apply f ts = build (app (fun f) ts)

data AState = S { nameMap     :: M.Map Name F
                , variableMap :: M.Map Name (Term F) 
                , nextVarId   :: Int
                }

type AM a = StateT AState (Except String) a

-- Introduce a new function symbol of a certain arity
-- to the context
addF :: Name -> Int -> AM ()
addF n i = modify $ \s -> s { nameMap = M.insert n (Function $ F i n) (nameMap s) }

getF :: Name -> AM F
getF n = do
  nm <- gets nameMap
  maybe (throwError "Unkown constructor error") return (M.lookup n nm)

getV :: Name -> AM (Term F)
getV n = do
  vm <- gets variableMap
  case M.lookup n vm of
    Nothing -> do
      id <- gets nextVarId 
      modify $ \s -> s { variableMap = M.insert n (build . var $ V id) vm, nextVarId = id + 1 } 
      return . build . var $ V id
    Just v -> return v

resetV :: AM ()
resetV = modify $ \s -> s { variableMap = M.empty, nextVarId = 0 }

exprToTerm :: Expr -> AM (Term F)
exprToTerm e = case e of
  FApp n es -> do
    f <- getF n
    apply f <$> mapM exprToTerm es

  CApp n es -> do
    f <- getF n
    apply f <$> mapM exprToTerm es

  Var n -> getV n

patternToTerm :: Pattern -> AM (Term F)
patternToTerm p = case p of
  ConstructorPattern n ps -> do
    f <- getF n
    apply f <$> mapM patternToTerm ps

  VariablePattern n -> getV n

functionToEquations :: Decl -> AM [Equation F]
functionToEquations d = case d of
  FunDecl f xs body -> case body of
    Case x ps -> sequence
        [ do resetV
             f   <- getF f 
             xs_ <- mapM getV xs
             pat <- patternToTerm pat
             -- Replace the occurance of `x` with `pat` in the list of arguments
             let xs' = [ if x /= x_i then x_t else pat | (x_i, x_t) <- zip xs xs_ ]
             e   <- exprToTerm expr
             return $ apply f xs' :=: e
        | (pat, expr) <- ps ]
  
    E e       -> do
      resetV
      f  <- getF f
      xs <- mapM getV xs
      e  <- exprToTerm e
      return [apply f xs :=: e]

  _ -> throwError "Argument to functionToEquations is not a function declaration"

-- | Precondition: The entire program has been alpha-renamed
axiomatise :: Program -> AM [Equation F]
axiomatise ps = do
  -- Introduce all constructors to the context
  sequence_ [ addF n (length ts)
            | DataDecl _ cs <- ps
            , (n, ts) <- cs]
  -- Introduce all functions to the context
  sequence_ [ addF n (length ns)
            | FunDecl n ns _ <- ps ]
  -- Compute axiomatisation from the functions
  concat <$> mapM functionToEquations [ f | f@(FunDecl _ _ _) <- ps ]
