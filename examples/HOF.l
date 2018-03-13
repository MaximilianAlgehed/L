{- WARNING:
  This file is for examples which are not yet fully supported
  by `lc`. Proceed with caution
-}

data Nat = Z | S Nat;
data NatList = Nil | Cons Nat NatList;

map : (Nat -> Nat) -> NatList -> NatList
map f xs = case xs of
    Nil       -> Nil
  | Cons x xs -> Cons (f x) (map f xs);

id : Nat -> Nat
id x = x;

theorem map-id
  forall xs : NatList. map id xs = xs;
