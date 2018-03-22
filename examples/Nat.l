
data Nat = Z | S Nat;

add : Nat -> Nat -> Nat
add n m = case n of
    Z   -> m
  | S n -> S (add n m);

lemma add-Z
  forall n : Nat. add n Z = n;

lemma add-S
  forall n m : Nat. add n (S m) = S (add n m);

lemma add-S-S
  forall n m : Nat. add (S n) (S m) = S (S (add n m))
using
  add-S;

lemma add-move-S
  forall n m : Nat. add (S n) m = add n (S m);

commutative : (Nat -> Nat -> Nat) -> Formula
commutative f = forall n m : Nat. f n m = f m n;

theorem add-comm
  commutative add
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

double : Nat -> Nat
double n = case n of
    Z   -> Z
  | S n -> S (S (double n));

theorem double-add
  forall n : Nat. double n = add n n
using
  add-S-S;
