

module L.Abs where

-- Haskell module generated by the BNF converter




newtype UIdent = UIdent String deriving (Eq, Ord, Show, Read)
newtype LIdent = LIdent String deriving (Eq, Ord, Show, Read)
data Program = P [Decl]
  deriving (Eq, Ord, Show, Read)

data Decl
    = DData UIdent [Constructor]
    | DFun LIdent Type LIdent [LIdent] Body
    | DThm LIdent Proposition
  deriving (Eq, Ord, Show, Read)

data Proposition
    = PForall LIdent Type Proposition | PEqual Expr Expr | PExpr Expr
  deriving (Eq, Ord, Show, Read)

data Constructor = C UIdent [Type]
  deriving (Eq, Ord, Show, Read)

data Type = MonoType UIdent | FunType Type Type
  deriving (Eq, Ord, Show, Read)

data Body = BCase LIdent [Alt] | BExpr Expr
  deriving (Eq, Ord, Show, Read)

data Alt = A Pat Expr
  deriving (Eq, Ord, Show, Read)

data Pat = PVar LIdent | PCon UIdent [Pat]
  deriving (Eq, Ord, Show, Read)

data Expr
    = EVar LIdent
    | ECon UIdent
    | EFApp LIdent [Expr]
    | ECApp UIdent [Expr]
  deriving (Eq, Ord, Show, Read)

