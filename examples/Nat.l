
data Nat = Z | S Nat;

add : Nat -> Nat -> Nat
add n m = case n of
    Z   -> m
  | S n -> S (add n m);

mul : Nat -> Nat -> Nat
mul n m = case n of
    Z   -> Z
  | S n -> add m (mul n m);

--theorem add_comm
--  forall n : Nat. forall m : Nat. add n m = add m n;
