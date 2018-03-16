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
        | T { arityF :: Int
            , typ    :: Type
            , invis  :: Bool }
        | SFPtr { arityF :: Int
                , invis :: Bool
                , nameF :: Name }
        | FPtr (Term F) Type
        | Apply { arityF :: Int, invis :: Bool }
        | FIfEq
        deriving (Ord, Eq, Show)

instance Sized FI where
  size _ = 1

instance Arity FI where
  arity FIfEq = 4
  arity f = arityF f

instance Pretty FI where
  pPrint FIfEq           = text "ifEq"
  pPrint t@(T _ _ _)     = text . ("tt" ++) . show . typ   $ t
  pPrint (Apply _ _)     = text "$"
  pPrint f@(SFPtr _ _ _) = text . ("*" ++) . show . nameF $ f
  pPrint f               = text . ("'" ++) . show . nameF $ f

instance EqualsBonus FI where

instance PrettyTerm FI where
  termStyle FIfEq = uncurried
  termStyle (Apply _ iv) = if iv then invisible else infixStyle 0
  termStyle f = if invis f then invisible else curried

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
  pPrintPrec _ _ Minimal = text "_"
  pPrintPrec _ _ (Skolem (V n)) = text "sk" <> pPrint n
  pPrintPrec l p (Function f) = pPrintPrec l p f

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
