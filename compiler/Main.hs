module Main where

import System.Environment
import Control.Monad.State

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
  ax <- case runAM $ axiomatise corePgm >> gets theory of
    Left err -> error err
    Right as -> return as


  putStrLn "\n== Base Axiomatisation =="
  mapM_ prettyPrint ax

  attacked <- case attack (Name problemName) corePgm of
    Left err -> error err
    Right ps -> return ps

  putStrLn $ "\n== Attacking Problem \"" ++ problemName ++ "\" =="
  sequence_ [ do unless (null (hypotheses p)) $ putStrLn "-- Induction Hypotheses --"
                 mapM_ prettyPrint (hypotheses p)
                 putStrLn "-- Goal --"
                 prettyPrint (goal p)
                 putStrLn "\n"
            | p <- attacked ]
