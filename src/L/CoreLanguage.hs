{-# LANGUAGE DeriveDataTypeable #-}
module L.CoreLanguage where

import Data.Data
import Data.Typeable
import Data.Generics.Uniplate.Data
import Data.List

import qualified L.TAbs as A
import qualified L.Abs as A (Type(..), LIdent(..), UIdent(..), Constructor(..))

-- Names
newtype Name = Name { getName :: String } deriving (Data, Typeable, Ord, Eq)

instance Show Name where
  show = getName

-- Programs
type Program = [Decl]

-- Types
data Type = FunctionType Type Type
          | Formula
          | TypeVar Name
          | TypeApp Name [Type]
          deriving (Data, Typeable, Ord, Eq)

instance Show Type where
  show (FunctionType t0 t1) = "(" ++ show t0 ++ " -> " ++ show t1 ++ ")"
  show Formula              = "Formula"
  show (TypeVar n)          = show n
  show (TypeApp n ts)       = show n ++ " " ++ intercalate " " (map show ts)

-- All declarations
data Decl = DataDecl    Name [Name] [(Name, [Type])]
          | FunDecl     Name Type [Name] {- Type variables -} [Name] {- Expression variables -} Body
          | TheoremDecl Name Proposition [Name]
          deriving (Ord, Eq, Show)

-- Propositions
data Proposition = Forall   Name Type Proposition
                 | Exists   Name Type Proposition
                 | Equal    Expr Expr
                 | NotEqual Expr Expr
                 | Implies  Expr Expr Proposition
                 | And      Proposition Proposition
                 -- Quantification over types
                 | ForallType Name Proposition
                 -- Things introduced by expressions
                 | PFApp   Name [Type] [Expr]
                 | PVar    Name
                 deriving (Ord, Eq, Show)

-- Negate a proposition
negatedNFP :: Proposition -> Proposition
negatedNFP p = case p of
  Forall n t p   -> Exists n t (negatedNFP p)
  Exists n t p   -> Forall n t (negatedNFP p)
  Equal l r      -> NotEqual l r
  Implies l r p  -> And (Equal l r) (negatedNFP p)
  ForallType t p -> ForallType t (negatedNFP p)

-- Function bodies
data Body = Case Name [(Pattern, Expr)]
          | E    Expr
          deriving (Ord, Eq, Show)

-- Patterns on the form "C0 x0 x1 (C1 x2 ...) ..."
data Pattern = ConstructorPattern Name [Type] [Pattern]
             | VariablePattern    Name
             deriving (Ord, Eq, Show)

-- Expressions
data Expr = FApp Name [Type] [Expr]
          | Var  Name
          | Prop Proposition
          deriving (Ord, Eq, Show)

{- Translate surface syntax to core syntax -}
splitType :: A.Type -> (Type, [Type])
splitType = splitCoreType . transType 

splitCoreType :: Type -> (Type, [Type])
splitCoreType = go []
  where
    go ts (FunctionType t0 t1) = go (t0 : ts) t1
    go ts t                    = (t, reverse ts)

transType :: A.Type -> Type
transType (A.TypeApp (A.UIdent t) ts) = TypeApp (Name t) (transType <$> ts)
transType (A.FunType t0 t1) = FunctionType (transType t0) (transType t1)
transType A.Formula = Formula

ftv :: Type -> [Name]
ftv t = nub [ n | TypeVar n <- universe t ]

substType :: Type -> (Name, Type) -> Type
substType t (x, t') = transform go t
  where
    go (TypeVar n)
      | n == x = t'
    go _ = t

substTypeList :: Type -> [(Name, Type)] -> Type
substTypeList t ss = foldr (flip substType) t ss

surfaceToCore :: A.Program -> Program
surfaceToCore (A.P ds) = concatMap decl ds
  where
    decl :: A.Decl -> [Decl]
    decl d = case d of
      -- FIXME: Make sure to give the right type variables here
      A.DData (A.UIdent n) cs -> [DataDecl (Name n) [] (map constructor cs)]

      A.DFun (A.LIdent n) t xs b ->
        [ FunDecl (Name n) (transType t) [ Name n | A.LIdent n <- A.bound t ] [ Name n | A.LIdent n <- xs ] (body b)]

      A.DThm t -> [theorem t]

    theorem :: A.Thm -> Decl
    theorem t = case t of
      A.TUsing (A.LIdent n) p ids      ->
        TheoremDecl (Name n) (proposition p) [ Name n | A.LIdent n <- ids ]

    proposition :: A.Expr -> Proposition
    proposition p = case p of

      A.EAll _ ns t p -> foldr (\(A.LIdent n) p -> Forall (Name n) (transType t) p)
                               (proposition p)
                               ns

      A.EEx _ ns t p -> foldr (\(A.LIdent n) p -> Exists (Name n) (transType t) p)
                               (proposition p)
                               ns

      A.EEqual _ el er -> Equal (expr el) (expr er)

      A.EImpl _ el er p -> Implies (expr el) (expr er) (proposition p)

      _                 -> case expr p of
        Var n        -> PVar n 
        FApp n ts xs -> PFApp n ts xs
        Prop p       -> p

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
      A.PVar _ (A.LIdent n)     -> VariablePattern (Name n)
      A.PCon (A.UIdent n) ts ps -> ConstructorPattern (Name n) (transType <$> ts) (map pattern ps)

    expr :: A.Expr -> Expr
    expr e = case e of
      A.EVar _ (A.LIdent x) -> Var (Name x)
      A.ECon _ (A.UIdent c) -> FApp (Name c) [] []
      A.EApp _ fun ts es    -> FApp (name fun) (transType <$> ts) (map expr es)
      _                     -> Prop (proposition e)
      where
        name (A.EVar _ (A.LIdent n)) = Name n
        name (A.ECon _ (A.UIdent n)) = Name n
