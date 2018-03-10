
{- Standard Nat theory -}
data Nat = Z | S Nat;

add : Nat -> Nat -> Nat
add n m = case n of
    Z   -> m
  | S n -> S (add n m);

lemma add-Z
  forall n : Nat. add n Z = n;

lemma add-S
  forall n : Nat. forall m : Nat. add n (S m) = S (add n m);

lemma add-move-S
  forall n : Nat. forall m : Nat. add (S n) m = add n (S m);

theorem add-comm
  forall n : Nat. forall m : Nat. add n m = add m n
using
  add-S add-Z;

theorem add-assoc
  forall a : Nat. forall b : Nat. forall c : Nat.
    add a (add b c) = add (add a b) c;

{- Expression trees for natural numbers -}
data Expr = Num Nat | Add Expr Expr | AddOne Expr;

mirror : Expr -> Expr
mirror e = case e of
    Num n -> Num n
  | Add l r -> Add (mirror r) (mirror l)
  | AddOne e -> AddOne (mirror e);

eval : Expr -> Nat
eval e = case e of
    Num n -> n
  | Add l r -> add (eval l) (eval r)
  | AddOne e -> S (eval e);

theorem eval-mirror
  forall e : Expr. eval (mirror e) = eval e
using
  add-comm;

theorem mirror-mirror
  forall e : Expr. mirror (mirror e) = e;
