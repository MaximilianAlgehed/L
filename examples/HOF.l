
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

fold : (Nat -> Nat -> Nat) -> Nat -> NatList -> Nat
fold f o xs = case xs of
    Nil       -> o
  | Cons x xs -> f x (fold f o xs);

add : Nat -> Nat -> Nat
add n m = case n of
    Z   -> m
  | S n -> S (add n m);

sum : NatList -> Nat
sum xs = case xs of
    Nil -> Z
  | Cons x xs -> add x (sum xs);

theorem sum-fold
  forall xs : NatList.
    sum xs = fold add Z xs;

addSome : Nat -> Nat -> Nat -> Nat
addSome y x z = add (add x y) z;

-- Eta expansion
theorem eta
  forall x : Nat.
  forall f : (Nat -> Nat). f x = (\x : Nat. f x) x;

compose : (Nat -> Nat) -> (Nat -> Nat -> Nat) -> Nat -> Nat -> Nat
compose mapper folder x y = folder (mapper x) y;

theorem map-fold
  forall xs : NatList.
  forall mapper : Nat -> Nat.
  forall folder : Nat -> Nat -> Nat.
  forall o : Nat.
  fold folder o (map mapper xs) = fold (compose mapper folder) o xs;
