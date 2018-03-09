
data Nat = Z | S Nat;

add : Nat -> Nat -> Nat
add n m = case n of
    Z   -> m
  | S n -> S (add n m);

theorem add-comm
  forall n : Nat. forall m : Nat. add n m = add m n;

theorem add-Z
  forall n : Nat. add n Z = add Z n;

theorem add-S
  forall n : Nat. forall m : Nat. add (S n) m = add n (S m);
