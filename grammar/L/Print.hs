{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}
module L.Print where

-- pretty-printer generated by the BNF converter

import L.Abs
import Data.Char


-- the top-level printing method
printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 (map ($ "") $ d []) "" where
  rend i ss = case ss of
    "["      :ts -> showChar '[' . rend i ts
    "("      :ts -> showChar '(' . rend i ts
    "{"      :ts -> showChar '{' . new (i+1) . rend (i+1) ts
    "}" : ";":ts -> new (i-1) . space "}" . showChar ';' . new (i-1) . rend (i-1) ts
    "}"      :ts -> new (i-1) . showChar '}' . new (i-1) . rend (i-1) ts
    ";"      :ts -> showChar ';' . new i . rend i ts
    t  : "," :ts -> showString t . space "," . rend i ts
    t  : ")" :ts -> showString t . showChar ')' . rend i ts
    t  : "]" :ts -> showString t . showChar ']' . rend i ts
    t        :ts -> space t . rend i ts
    _            -> id
  new i   = showChar '\n' . replicateS (2*i) (showChar ' ') . dropWhile isSpace
  space t = showString t . (\s -> if null s then "" else (' ':s))

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- the printer class does the job
class Print a where
  prt :: Int -> a -> Doc
  prtList :: Int -> [a] -> Doc
  prtList i = concatD . map (prt i)

instance Print a => Print [a] where
  prt = prtList

instance Print Char where
  prt _ s = doc (showChar '\'' . mkEsc '\'' s . showChar '\'')
  prtList _ s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q s = case s of
  _ | s == q -> showChar '\\' . showChar s
  '\\'-> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  _ -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j<i then parenth else id


instance Print Integer where
  prt _ x = doc (shows x)


instance Print Double where
  prt _ x = doc (shows x)


instance Print Ident where
  prt _ (Ident i) = doc (showString ( i))
  prtList _ [] = (concatD [])
  prtList _ (x:xs) = (concatD [prt 0 x, prt 0 xs])

instance Print UIdent where
  prt _ (UIdent i) = doc (showString ( i))


instance Print LIdent where
  prt _ (LIdent i) = doc (showString ( i))



instance Print Program where
  prt i e = case e of
    P decls -> prPrec i 0 (concatD [prt 0 decls])

instance Print Decl where
  prt i e = case e of
    DData uident constructors -> prPrec i 0 (concatD [doc (showString "data"), prt 0 uident, doc (showString "="), prt 0 constructors])
    DFun lident1 type_ lident2 ids body -> prPrec i 0 (concatD [prt 0 lident1, doc (showString ":"), prt 0 type_, prt 0 lident2, prt 0 ids, doc (showString "="), prt 0 body])
  prtList _ [x] = (concatD [prt 0 x])
  prtList _ (x:xs) = (concatD [prt 0 x, prt 0 xs])
instance Print Constructor where
  prt i e = case e of
    C uident types -> prPrec i 0 (concatD [prt 0 uident, doc (showString "("), prt 0 types, doc (showString ")")])
  prtList _ [] = (concatD [])
  prtList _ [x] = (concatD [prt 0 x])
  prtList _ (x:xs) = (concatD [prt 0 x, doc (showString "|"), prt 0 xs])
instance Print Type where
  prt i e = case e of
    MonoType id -> prPrec i 1 (concatD [prt 0 id])
    FunType type_1 type_2 -> prPrec i 0 (concatD [prt 1 type_1, doc (showString "->"), prt 0 type_2])
  prtList _ [] = (concatD [])
  prtList _ (x:xs) = (concatD [prt 0 x, prt 0 xs])
instance Print Body where
  prt i e = case e of
    BCase id alts -> prPrec i 0 (concatD [doc (showString "case"), prt 0 id, doc (showString "of"), prt 0 alts])
    BExpr expr -> prPrec i 0 (concatD [prt 0 expr])

instance Print Alt where
  prt i e = case e of
    A pat expr -> prPrec i 0 (concatD [prt 0 pat, doc (showString "->"), prt 0 expr])
  prtList _ [] = (concatD [])
  prtList _ [x] = (concatD [prt 0 x])
  prtList _ (x:xs) = (concatD [prt 0 x, doc (showString "|"), prt 0 xs])
instance Print Pat where
  prt i e = case e of
    PVar id -> prPrec i 1 (concatD [prt 0 id])
    PCon uident pats -> prPrec i 0 (concatD [prt 0 uident, prt 1 pats])
  prtList 1 [] = (concatD [])
  prtList 1 (x:xs) = (concatD [prt 1 x, prt 1 xs])
instance Print Expr where
  prt i e = case e of
    EVar id -> prPrec i 1 (concatD [prt 0 id])
    EApp id exprs -> prPrec i 0 (concatD [prt 0 id, prt 1 exprs])
  prtList 1 [x] = (concatD [prt 1 x])
  prtList 1 (x:xs) = (concatD [prt 1 x, prt 1 xs])

