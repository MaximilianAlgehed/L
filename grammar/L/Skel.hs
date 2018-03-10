module L.Skel where

-- Haskell module generated by the BNF converter

import L.Abs
import L.ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transUIdent :: UIdent -> Result
transUIdent x = case x of
  UIdent string -> failure x
transLIdent :: LIdent -> Result
transLIdent x = case x of
  LIdent string -> failure x
transProgram :: Program -> Result
transProgram x = case x of
  P decls -> failure x
transDecl :: Decl -> Result
transDecl x = case x of
  DData uident constructors -> failure x
  DFun lident1 type_ lident2 lidents expr -> failure x
  DThm thm -> failure x
transThm :: Thm -> Result
transThm x = case x of
  TStandalone lident proposition -> failure x
  TUsing lident proposition lidents -> failure x
  TLemma lident proposition -> failure x
  TLemmaUsing lident proposition lidents -> failure x
transProposition :: Proposition -> Result
transProposition x = case x of
  PForall lidents type_ proposition -> failure x
  PEqual expr1 expr2 -> failure x
  PExpr expr -> failure x
transConstructor :: Constructor -> Result
transConstructor x = case x of
  C uident types -> failure x
transType :: Type -> Result
transType x = case x of
  MonoType uident -> failure x
  FunType type_1 type_2 -> failure x
transExpr :: Expr -> Result
transExpr x = case x of
  EVar lident -> failure x
  ECon uident -> failure x
  EFApp lident exprs -> failure x
  ECApp uident exprs -> failure x
  ECase expr alts -> failure x
transAlt :: Alt -> Result
transAlt x = case x of
  A pat expr -> failure x
transPat :: Pat -> Result
transPat x = case x of
  PVar lident -> failure x
  PCon uident pats -> failure x

