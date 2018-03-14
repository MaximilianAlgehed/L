module L.CoreLanguage where

import qualified L.TAbs as A
import qualified L.Abs as A (Type(..), LIdent(..), UIdent(..), Constructor(..))

-- Names
newtype Name = Name { getName :: String } deriving (Ord, Eq)

instance Show Name where
  show = getName

-- Programs
type Program = [Decl]

-- Types
data Type = MonoType Name | FunctionType Type Type
          deriving (Ord, Eq)

instance Show Type where
  show (FunctionType t0 t1) = "(" ++ show t0 ++ "'2'" ++ show t1 ++ ")"
  show (MonoType n)         = show n

-- All declarations
data Decl = DataDecl    Name [(Name, [Type])]
          | TypeDecl    Name (Type, [Type])
          | FunDecl     Name [Name] Body
          | TheoremDecl Name Proposition [Name]
          deriving (Ord, Eq, Show)

-- Propositions
data Proposition = Forall  Name Type Proposition
                 | Equal   Expr Expr
                 | Boolean Expr
                 deriving (Ord, Eq, Show)

-- Function bodies
data Body = Case Name [(Pattern, Expr)]
          | E    Expr
          deriving (Ord, Eq, Show)

-- Patterns on the form "C0 x0 x1 (C1 x2 ...) ..."
data Pattern = ConstructorPattern Name [Pattern]
             | VariablePattern    Name
             deriving (Ord, Eq, Show)

-- Expressions
data Expr = FApp Name [Expr]
          | Var  Name
          deriving (Ord, Eq, Show)

{- Translate surface syntax to core syntax -}
splitType :: A.Type -> (Type, [Type])
splitType = go []
  where
    go ts (A.MonoType (A.UIdent t)) = (MonoType (Name t), reverse ts)
    go ts (A.FunType t0 t1)        = go (transType t0 : ts) t1

splitCoreType :: Type -> (Type, [Type])
splitCoreType = go []
  where
    go ts (MonoType n)         = (MonoType n, reverse ts)
    go ts (FunctionType t0 t1) = go (t0 : ts) t1

transType :: A.Type -> Type
transType (A.MonoType (A.UIdent t)) = MonoType (Name t)
transType (A.FunType t0 t1) = FunctionType (transType t0) (transType t1)

surfaceToCore :: A.Program -> Program
surfaceToCore (A.P ds) = concatMap decl ds
  where
    decl :: A.Decl -> [Decl]
    decl d = case d of
      A.DData (A.UIdent n) cs -> [DataDecl (Name n) (map constructor cs)]

      A.DFun (A.LIdent n) t xs b ->
        [ TypeDecl (Name n) (splitType t)
        , FunDecl (Name n) [ Name x | A.LIdent x <- xs ] (body b)]

      A.DThm t -> [theorem t]

    theorem :: A.Thm -> Decl
    theorem t = case t of
      A.TUsing (A.LIdent n) p ids      ->
        TheoremDecl (Name n) (proposition p) [ Name n | A.LIdent n <- ids ]

    proposition :: A.Proposition -> Proposition
    proposition p = case p of
      A.PForall ns t p -> foldr (\(A.LIdent n) p -> Forall (Name n) (transType t) p)
                                (proposition p)
                                ns
      A.PEqual el er   -> Equal (expr el) (expr er)
      A.PExpr e        -> Boolean (expr e)

    constructor :: A.Constructor -> (Name, [Type])
    constructor (A.C (A.UIdent n) ts) = (Name n, map transType ts)

    body :: A.Expr -> Body
    body b = case b of 
      A.ECase _ (A.EVar _ (A.LIdent x)) as ->
        Case (Name x) (map alternative as)
      e                       -> E (expr e)

    alternative :: A.Alt -> (Pattern, Expr)
    alternative (A.A p e) = (pattern p, expr e)

    pattern :: A.Pat -> Pattern
    pattern p = case p of
      A.PVar _ (A.LIdent n)  -> VariablePattern (Name n)
      A.PCon (A.UIdent n) ps -> ConstructorPattern (Name n) (map pattern ps)

    expr :: A.Expr -> Expr
    expr e = case e of
      A.EVar _ (A.LIdent x) -> Var (Name x)
      A.ECon _ (A.UIdent c) -> FApp (Name c) []
      A.EApp _ fun es       -> FApp (name fun) (map expr es)
      where
        name (A.EVar _ (A.LIdent n)) = Name n
        name (A.ECon _ (A.UIdent n)) = Name n
