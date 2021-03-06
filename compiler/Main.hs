module Main where

-- Constructors
import System.Environment
import Control.Monad.State

import Twee.Base hiding (subst, Function)
import Twee.Term
import Twee.Equation
import Twee.Proof (Axiom(..))
import Twee.Rule (Resulting(..))
import Twee hiding (goal)
import qualified Twee as T
import Twee.Pretty
import qualified Twee.Proof as Proof

import L.FunctionSymbols
import L.ErrM
import L.Par
import L.Axiomatisation
import L.Normalisation
import L.CoreLanguage
import L.TypeCheck

-- These parameters are pretty dumb, but they are good enough
-- for playing around
cfg = defaultConfig

present :: String -> Equation F -> IO ()
present name eq = putStr (name ++ ": ") >> prettyPrint eq

main :: IO ()
main = do
  [f, problemName] <- getArgs 
  raw <- readFile f
  corePgm <- case pProgram (myLexer raw) of
    Ok p  -> case runTC $ typeCheck Nothing p of
      Right p -> do
        return . surfaceToCore . normalise $ p
      Left e  -> error e
    Bad e -> error e

  ax <- case runAM $ axiomatise corePgm >> gets theory of
    Left err -> error err
    Right as -> return as

  -- TODO: Make the choice of induction schema up to the user
  attacked <- case attack structInductOnFirst (Name problemName) corePgm of
    Left err -> error err
    Right ps -> return ps

  -- TODO: Factor out
  putStrLn $ "\n== Trying to prove \"" ++ problemName ++ "\" ==\n"
  putStrLn "-- Background Theory --"
  let p = head attacked
  mapM_ (uncurry present) (background p)
  unless (null (lemmas p)) $ putStrLn "-- Lemmas --"
  mapM_ (uncurry present) (lemmas p)
  putStrLn "\n"
  sequence_ [ do putStrLn $ "*** [case " ++ show caseN ++ "] ***"
                 unless (null (hypotheses p)) $ putStrLn "-- Hypotheses --"
                 mapM_ (uncurry present) (hypotheses p)
                 putStrLn "-- Goal --"
                 prettyPrint (goal p)
                 let axioms = [ Axiom i axName ax
                              | ((axName, ax), i) <- zip (hypotheses p ++ lemmas p ++ background p) [0..] ]
                 let g = T.goal 0 (problemName ++ ", case " ++ show caseN) $ goal p 
                 let st = addGoal cfg (foldr (\a s -> addAxiom cfg s a) initialState axioms) g
                 completedState <- normaliseGoals <$> complete (Output $ \_ -> return ()) cfg st
                 if solved completedState then do
                   putStrLn "*** closed goal ***\n"
                   prettyPrint (Proof.present Proof.defaultConfig (solutions completedState))
                 else do
                   putStrLn "Didn't close goal"
                 putStrLn "\n"
            | (p, caseN) <- zip attacked [0..] ]
