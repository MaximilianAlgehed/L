

module L.Abs where

-- Haskell module generated by the BNF converter




newtype UIdent = UIdent String deriving (Eq, Ord, Show, Read)
newtype LIdent = LIdent String deriving (Eq, Ord, Show, Read)
data Program = P [Decl]
  deriving (Eq, Ord, Show, Read)

data Decl
    = DData UIdent [Constructor]
    | DFun LIdent Type LIdent [LIdent] Expr
    | DThm Thm
  deriving (Eq, Ord, Show, Read)

data Thm
    = TStandalone LIdent Proposition
    | TUsing LIdent Proposition [LIdent]
    | TLemma LIdent Proposition
    | TLemmaUsing LIdent Proposition [LIdent]
  deriving (Eq, Ord, Show, Read)

data Proposition
    = PForall [LIdent] Type Proposition
    | PImplies Expr Expr Proposition
    | PEqual Expr Expr
    | PExpr Expr
  deriving (Eq, Ord, Show, Read)

data Constructor = C UIdent [Type]
  deriving (Eq, Ord, Show, Read)

data Type = MonoType UIdent | FunType Type Type
  deriving (Eq, Ord, Show, Read)

data Expr
    = EVar LIdent
    | ECon UIdent
    | EApp Expr [Expr]
    | ELam LIdent Type Expr
    | ECase Expr [Alt]
  deriving (Eq, Ord, Show, Read)

data Alt = A Pat Expr
  deriving (Eq, Ord, Show, Read)

data Pat = PVar LIdent | PConE UIdent | PCon UIdent [Pat]
  deriving (Eq, Ord, Show, Read)

