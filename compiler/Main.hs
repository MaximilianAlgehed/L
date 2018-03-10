module Main where

-- Constructors
import System.Environment
import Control.Monad.State

import Twee.Equation
import Twee.Proof (Axiom(..))
import Twee.Rule (Resulting(..))
import Twee hiding (goal)
import qualified Twee as T
import Twee.Pretty

import L.ErrM
import L.Par
import L.Axiomatisation
import L.CoreLanguage

-- These parameters are pretty dumb, but they are good enough
-- for playing around
cfg = defaultConfig { cfg_max_cp_depth = 10
                    , cfg_max_critical_pairs = 10000 }

main :: IO ()
main = do
  [f, problemName] <- getArgs 
  raw <- readFile f
  corePgm <- case pProgram (myLexer raw) of
    Ok p  -> return (surfaceToCore p)
    Bad e -> error e

  ax <- case runAM $ axiomatise corePgm >> gets theory of
    Left err -> error err
    Right as -> return as

  attacked <- case attack (Name problemName) corePgm of
    Left err -> error err
    Right ps -> return ps

  putStrLn $ "\n== Trying to prove \"" ++ problemName ++ "\" ==\n"
  sequence_ [ do putStrLn "-- Base Theory --"
                 mapM_ prettyPrint (given p)
                 unless (null (lemmas p)) $ putStrLn "-- Lemmas --"
                 mapM_ prettyPrint (lemmas p)
                 unless (null (hypotheses p)) $ putStrLn "-- Hypotheses --"
                 mapM_ prettyPrint (hypotheses p)
                 putStrLn "-- Goal --"
                 prettyPrint (goal p)
                 let axioms = [ Axiom i ("ax" ++ show i) ax
                              | (ax, i) <- zip (hypotheses p ++ given p ++ lemmas p) [0..] ]
                 let g = T.goal 0 "the goal" (goal p)
                 let st = addGoal cfg (foldr (\a s -> addAxiom cfg s a) initialState axioms) g
                 completedState <- normaliseGoals <$> complete (Output $ \_ -> return ()) cfg st
                 putStrLn "\n"
                 if solved completedState then
                   putStrLn "Closed goal"
                 else do
                   putStrLn "Didn't close goal:"
                   let lhs :=: rhs = goal p
                   prettyPrint $  result (normaliseTerm completedState lhs)
                              :=: result (normaliseTerm completedState rhs)
                 putStrLn "\n"
            | p <- attacked ]
