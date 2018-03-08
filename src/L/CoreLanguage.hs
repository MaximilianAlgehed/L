module L.CoreLanguage where

-- Names
newtype Name = Name { getName :: String } deriving (Ord, Eq)

instance Show Name where
  show = getName

-- Programs
type Program = [Decl]

-- Types
data Type = MonoType Name
          | Fun Type Type

-- All declarations
data Decl = DataDecl    Name [(Name, [Type])] -- [(ConstructorName, [ConstructorArguments])]
          | TypeDecl    Name Type
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
          | CApp Name [Expr]
          | Var  Name
