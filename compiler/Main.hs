module Main where

-- Constructors
import System.Environment
import Control.Monad.State

import Twee.Proof (Axiom(..))
import Twee hiding (goal)
import qualified Twee as T
import Twee.Pretty

import L.ErrM
import L.Par
import L.Axiomatisation
import L.CoreLanguage

main :: IO ()
main = do
  [f, problemName] <- getArgs 
  raw <- readFile f
  corePgm <- case pProgram (myLexer raw) of
    Ok p  -> return (surfaceToCore p)
    Bad e -> error e

  putStrLn "\n== Core Abtract Syntax =="
  print corePgm

  ax <- case runAM $ axiomatise corePgm >> gets theory of
    Left err -> error err
    Right as -> return as

  putStrLn "\n== Base Axiomatisation =="
  mapM_ prettyPrint ax

  attacked <- case attack (Name problemName) corePgm of
    Left err -> error err
    Right ps -> return ps

  putStrLn $ "\n== Attacking Problem \"" ++ problemName ++ "\" =="
  sequence_ [ do putStrLn "-- Theory --"
                 mapM_ prettyPrint (given p)
                 unless (null (hypotheses p)) $ putStrLn "-- Hypotheses --"
                 mapM_ prettyPrint (hypotheses p)
                 putStrLn "-- Goal --"
                 prettyPrint (goal p)
                 let axioms = [ Axiom i ("ax" ++ show i) ax | (ax, i) <- zip (hypotheses p ++ given p) [0..] ]
                 let g = T.goal 0 "the goal" (goal p)
                 let st = addGoal defaultConfig (foldr (\a s -> addAxiom defaultConfig s a) initialState axioms) g
                 st' <- complete (Output (\_ -> return ())) defaultConfig st
                 putStrLn "\n"
                 if solved st then
                   putStrLn "Twee solved it!"
                 else
                   putStrLn "Twee didn't solve it"
                 putStrLn "\n"
            | p <- attacked ]
