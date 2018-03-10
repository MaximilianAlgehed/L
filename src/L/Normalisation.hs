module L.Normalisation where

import Control.Monad.State
import qualified Data.Map as M

import L.Abs (Type(..), LIdent(..), UIdent(..))
import L.TAbs

data ST = St { nextId        :: Int
             , variableTypes :: [M.Map LIdent Type] }

type NM a = State ST a

runNorm :: NM a -> a
runNorm m = evalState m $ St { nextId = 0, variableTypes = [] }

next :: LIdent -> NM LIdent
next (LIdent n) = do
  i <- gets nextId
  modify $ \s -> s { nextId = i + 1}
  return . LIdent $ n ++ "'" ++ show i

lookupVar :: LIdent -> NM Type
lookupVar v = do
  ctx <- gets variableTypes
  case [ t | Just t <- M.lookup v <$> ctx ] of
    []    -> fail "Error"
    (t:_) -> return t

push :: NM ()
push = modify $ \s -> s { variableTypes = M.empty : variableTypes s }

pop :: NM ()
pop = modify $ \s -> s { variableTypes = drop 1 (variableTypes s) }

introduce :: LIdent -> Type -> NM ()
introduce v t = do
  ctx <- gets variableTypes
  case ctx of
    []     -> fail "Error" 
    (m:ms) -> case M.lookup v m of
      Nothing -> modify $ \s -> s { variableTypes = M.insert v t m : ms }
      Just _  -> fail "Error"

normalise :: Program -> Program
normalise (P pgm) = P . concat . runNorm . mapM normaliseDecl $ pgm

normaliseDecl :: Decl -> NM [Decl]
normaliseDecl d = case d of
  DFun f t xs body -> error "Normalisation is undefined"
  d -> return [d]
