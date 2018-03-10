
data Nat = Z | S Nat;

add : Nat -> Nat -> Nat
add n m = case n of
    Z   -> m
  | S n -> S (add n m);

lemma add-Z
  forall n : Nat. add n Z = n;

lemma add-S
  forall n : Nat. forall m : Nat. add n (S m) = S (add n m);

theorem add-comm
  forall n : Nat. forall m : Nat. add n m = add m 
using
  add-S add-Z;
