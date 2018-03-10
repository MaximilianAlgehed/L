
data Nat = Z | S Nat;

add : Nat -> Nat -> Nat
add n m = case n of
    Z   -> m
  | S n -> S (add n m);

lemma add-Z
  forall n : Nat. add n Z = n;

lemma add-S
  forall n m : Nat. add n (S m) = S (add n m);

lemma add-move-S
  forall n m : Nat. add (S n) m = add n (S m);

theorem add-comm
  forall n m : Nat. add n m = add m n
using
  add-S add-Z;

theorem add-assoc
  forall a b c : Nat.
    add a (add b c) = add (add a b) c;

addFast : Nat -> Nat -> Nat
addFast n m = case n of
    Z   -> m
  | S n -> addFast n (S m);

theorem add-addFast
  forall n m : Nat. add n m = addFast n m
using
  add-move-S;

mul : Nat -> Nat -> Nat
mul n m = case n of
    Z   -> Z
  | S n -> add m (mul n m);

lemma mul-Z
  forall n : Nat. mul n Z = Z;

-- The proof of this theorem fails in the step case
theorem mul-comm
  forall n m : Nat.
    mul n m = mul m n
using
  mul-Z;

-- The proof of this theorem fails in the step case
theorem mul-assoc
  forall a b c : Nat.
    mul a (mul b c) = mul (mul a b) c;
