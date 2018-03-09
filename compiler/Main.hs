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
  [f] <- getArgs 
  raw <- readFile f
  corePgm <- case pProgram (myLexer raw) of
    Ok p  -> return (surfaceToCore p)
    Bad e -> error e
  ax <- case runAM $ axiomatise corePgm >> gets theory of
    Left err -> error err
    Right as -> return as

  putStrLn "== Axiomatisation =="
  mapM_ prettyPrint ax
