module L.CoreLanguage where

import qualified L.Abs as A 

-- Names
newtype Name = Name { getName :: String } deriving (Ord, Eq)

instance Show Name where
  show = getName

-- Programs
type Program = [Decl]

-- Types
data Type = MonoType { typeName :: Name } deriving (Ord, Eq)

instance Show Type where
  show = show . typeName

-- All declarations
data Decl = DataDecl    Name [(Name, [Type])]
          | TypeDecl    Name (Type, [Type])
          | FunDecl     Name [Name] Body
          | TheoremDecl Name Proposition

-- Propositions
data Proposition = Forall  Name Type Proposition
                 | Equal   Expr Expr
                 | Boolean Expr

-- Function bodies
data Body = Case Name [(Pattern, Expr)]
          | E    Expr

-- Patterns on the form "C0 x0 x1 (C1 x2 ...) ..."
data Pattern = ConstructorPattern Name [Pattern]
             | VariablePattern    Name

-- Expressions
data Expr = FApp Name [Expr]
          | Var  Name

{- Translate surface syntax to core syntax -}
splitType :: A.Type -> (Type, [Type])
splitType = go []
  where
    go ts (A.MonoType (A.Ident t)) = (MonoType (Name t), ts)
    go ts (A.FunType t0 t1)        = go (monoType t0 : ts) t1

monoType :: A.Type -> Type
monoType (A.MonoType (A.Ident t)) = MonoType (Name t)

surfaceToCore :: A.Program -> Program
surfaceToCore (A.P ds) = concatMap decl ds
  where
    decl :: A.Decl -> [Decl]
    decl d = case d of
      A.DData (A.UIdent n) cs -> [DataDecl (Name n) (map constructor cs)]

      A.DFun (A.LIdent n) t (A.Ident n') xs b ->
        [ TypeDecl (Name n) (splitType t)
        , FunDecl (Name n) [ Name x | A.Ident x <- xs ] (body b)]

    constructor :: A.Constructor -> (Name, [Type])
    constructor (A.C (A.UIdent n) ts) = (Name n, map monoType ts)

    body :: A.Body -> Body
    body b = case b of 
      A.BCase (A.Ident x) as -> Case (Name x) (map alternative as)
      A.BExpr e              -> E (expr e)

    alternative :: A.Alt -> (Pattern, Expr)
    alternative (A.A p e) = (pattern p, expr e)

    pattern :: A.Pat -> Pattern
    pattern p = case p of
      A.PVar (A.Ident n)     -> VariablePattern (Name n)
      A.PCon (A.UIdent n) ps -> ConstructorPattern (Name n) (map pattern ps)

    expr :: A.Expr -> Expr
    expr e = case e of
      A.EVar (A.Ident x)    -> Var (Name x)
      A.EApp (A.Ident f) es -> FApp (Name f) (map expr es)
