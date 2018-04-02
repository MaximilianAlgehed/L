{-# LANGUAGE FlexibleInstances, DeriveFunctor #-}
module L.FunctionSymbols where

import Data.Typeable

import Twee hiding (goal)
import qualified Twee.Term as T
import Twee.Term hiding (Var, F)
import Twee.Base hiding (Var, F, Extended(..))
import Twee.Equation
import qualified Twee.KBO

import L.CoreLanguage

hideTypeTags :: Bool
hideTypeTags = True

hideApply :: Bool
hideApply = False

type F = Ext FI

data FI = F { arityF :: Int
            , nameF  :: Name
            , invis  :: Bool
            }
        | T { typ    :: Name
            , arityF :: Int
            , invis  :: Bool }
        | FT { invis  :: Bool }
        | TT { invis :: Bool }
        | SFPtr { invis :: Bool
                , nameF :: Name }
        | FPtr (Term F) Type
        | TypeApply { arityF :: Int, invis :: Bool }
        | Apply { invis :: Bool }
        | Skf { skIdx :: Int, artiyF :: Int }
        | FIfEq
        | F_equals
        | F_true
        | F_false
        deriving (Ord, Eq, Show)

instance Sized FI where
  size _ = 1

instance Arity FI where
  arity F_true      = 0
  arity F_false     = 0
  arity F_equals    = 2
  arity FIfEq       = 4
  arity (FT _)      = 2
  arity (TT _)      = 2
  arity (Apply _)   = 2
  arity (SFPtr _ _) = 0
  arity f           = arityF f

instance Pretty FI where
  pPrint F_true        = text "true"
  pPrint F_false       = text "false"
  pPrint F_equals      = text "=="
  pPrint FIfEq         = text "ifEq"
  pPrint (T n _ _)     = text (show n)
  pPrint (FT _)        = text "fun"
  pPrint (TT _)        = text "tt"
  pPrint (Apply _)     = text "$"
  pPrint f@(SFPtr _ _) = text . ("*" ++) . show . nameF $ f
  pPrint (Skf i _)     = text $ "skf" ++ show i
  pPrint f             = text . ("'" ++) . show . nameF $ f

instance EqualsBonus FI where
  hasEqualsBonus F_equals = True
  hasEqualsBonus FIfEq    = True
  hasEqualsBonus _        = False

  isEquals F_equals = True
  isEquals _        = False

  isTrue F_true = True
  isTrue _ = False

  isFalse F_false = True
  isFalse _ = False

instance PrettyTerm FI where
  termStyle (TT iv)    = if iv then implicitArguments 1 invisible else curried 
  termStyle FIfEq      = uncurried
  termStyle (Apply iv) = if iv then invisible else infixStyle 0
  termStyle F_true     = curried
  termStyle F_false    = curried
  termStyle F_equals   = infixStyle 0
  termStyle (Skf _ _)  = curried
  termStyle f          = if invis f then invisible else curried

instance Ordered (Ext FI) where
  lessEq = Twee.KBO.lessEq
  lessIn = Twee.KBO.lessIn

-- | A function symbol extended with a minimal constant and Skolem functions.
-- Comes equipped with 'Minimal' and 'Skolem' instances.
--
-- Stolen from Twee.Base and adapted
data Ext f =
    -- | The minimal constant.
    Minimal
    -- | A Skolem function.
  | Skolem T.Var
    -- | An ordinary function symbol.
  | Function f
  deriving (Eq, Ord, Show, Functor)

instance Pretty f => Pretty (Ext f) where
  pPrintPrec _ _ Minimal             = text "_"
  pPrintPrec _ _ (Skolem (V n))      = text "sk" <> pPrint n
  pPrintPrec l p (Function f)        = pPrintPrec l p f

instance PrettyTerm f => PrettyTerm (Ext f) where
  termStyle (Function f) = termStyle f
  termStyle _ = uncurried

instance Sized f => Sized (Ext f) where
  size (Function f) = size f
  size _ = 1

instance Arity f => Arity (Ext f) where
  arity (Function f) = arity f
  arity _ = 0

instance (Typeable f, Ord f) => Minimal (Ext f) where
  minimal = fun Minimal

instance (Typeable f, Ord f) => Skolem (Ext f) where
  skolem x = fun (Skolem x)

  getSkolem (T.F (Skolem x)) = Just x
  getSkolem _ = Nothing

instance EqualsBonus f => EqualsBonus (Ext f) where
  hasEqualsBonus (Function f) = hasEqualsBonus f
  hasEqualsBonus _ = False

  isEquals (Function f) = isEquals f
  isEquals _ = False

  isTrue (Function f) = isTrue f
  isTrue _ = False

  isFalse (Function f) = isFalse f
  isFalse _ = False
