
data Nat = Z | S Nat;
data NatList = Nil | Cons Nat NatList;

map : (Nat -> Nat) -> NatList -> NatList
map f xs = case xs of
    Nil       -> Nil
  | Cons x xs -> Cons (f x) (map f xs);

fold : (Nat -> Nat -> Nat) -> Nat -> NatList -> Nat
fold f o xs = case xs of
    Nil       -> o
  | Cons x xs -> f x (fold f o xs);

compose : (Nat -> Nat) -> (Nat -> Nat -> Nat) -> Nat -> Nat -> Nat
compose mapper folder x y = folder (mapper x) y;

theorem map-fold
  forall xs : NatList.
  forall mapper : Nat -> Nat.
  forall folder : Nat -> Nat -> Nat.
  forall o : Nat.
  fold folder o (map mapper xs) = fold (compose mapper folder) o xs;
