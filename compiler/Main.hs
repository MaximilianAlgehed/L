module Main where

import System.Environment

import L.ErrM
import L.Par
import L.Axiomatisation
import L.CoreLanguage

main :: IO ()
main = do
  [f] <- getArgs 
  raw <- readFile f
  pgm <- case pProgram (myLexer raw) of
    Ok p  -> return (surfaceToCore p)
    Bad e -> error e
  print pgm
