
module L.TAbs where

import L.Abs (Type(..), LIdent, UIdent, Constructor)

data Program = P [Decl]
  deriving (Eq, Ord, Show, Read)

data Decl
    = DData UIdent [Constructor]
    | DFun LIdent Type [LIdent] Expr
    | DThm Thm
  deriving (Eq, Ord, Show, Read)

data Thm
    = TStandalone LIdent Proposition
    | TUsing LIdent Proposition [LIdent]
    | TLemma LIdent Proposition
    | TLemmaUsing LIdent Proposition [LIdent]
  deriving (Eq, Ord, Show, Read)

data Proposition
    = PForall [LIdent] Type Proposition | PEqual Expr Expr | PExpr Expr
  deriving (Eq, Ord, Show, Read)

data Expr
    = EVar { exprType :: Type, exprVar :: LIdent }
    | ECon { exprType :: Type, exprCon :: UIdent }
    | EFApp { exprType :: Type, exprFun :: LIdent, exprArgs :: [Expr] }
    | ECApp { exprType :: Type, exprCon :: UIdent, exprArgs :: [Expr] }
    | ECase { exprType :: Type, exprCaseOn :: Expr, exprAlts ::  [Alt] }
  deriving (Eq, Ord, Show, Read)

data Alt = A Pat Expr
  deriving (Eq, Ord, Show, Read)

data Pat = PVar Type LIdent | PCon UIdent [Pat]
  deriving (Eq, Ord, Show, Read)

split :: Type -> (Type, [Type])
split (MonoType ui) = (MonoType ui, [])
split (FunType a r) =
  let (res, as) = split r in (res, a : as)
