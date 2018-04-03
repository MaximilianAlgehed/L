
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
    = TUsing LIdent Expr [LIdent]
  deriving (Eq, Ord, Show, Read)

data Expr
    = EVar   { exprType :: Type, exprVar     :: LIdent }
    | ECon   { exprType :: Type, exprCon     :: UIdent }
    | ECase  { exprType :: Type, exprCaseOn  :: Expr,     exprAlts     :: [Alt]   }
    | EEqual { exprType :: Type, exprLhs     :: Expr,     exprRhs      :: Expr    }
    | EImpl  { exprType :: Type, exprLhs     :: Expr,     exprRhs      :: Expr,       exprConsequent :: Expr   }
    | EAll   { exprType :: Type, exprAllArgs :: [LIdent], exprArgsType :: Type,       exprProp       :: Expr   }
    | EEx    { exprType :: Type, exprExArgs  :: [LIdent], exprArgsType :: Type,       exprProp       :: Expr   }
    | EApp   { exprType :: Type, exprFun     :: Expr,     exprTypeArgs :: [Type],     exprArgs       :: [Expr] }
    | ELam   { exprType :: Type, exprAbsTVar :: [LIdent], exprAbsVar   :: [LIdent],   exprBody     :: Expr    }
  deriving (Eq, Ord, Show, Read)

data Alt = A Pat Expr
  deriving (Eq, Ord, Show, Read)

data Pat = PVar Type LIdent | PCon UIdent [Type] [Pat]
  deriving (Eq, Ord, Show, Read)

split :: Type -> (Type, [Type])
split (FunType a r) =
  let (res, as) = split r in (res, a : as)
split t = (t, [])

partialType :: Expr -> Bool
partialType e = case exprType e of
  FunType _ _ -> True
  _           -> False

bound :: Type -> [LIdent]
bound (TypeAll a t) = a : bound t
bound _             = []
