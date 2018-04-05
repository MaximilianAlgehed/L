
data Nat = Z | S Nat;
data Bool = True | False;

ge : Nat -> Nat -> Bool;
ge x y = case y of
    Z   -> True
  | S y -> (case x of
              Z   -> False
            | S x -> ge x y);

lemma ge-Z
  forall x : Nat. ge Z x = True => x = Z;

lemma ge-S
  forall y x : Nat. ge x y = True => ge (S x) y = True
using ge-Z;

theorem ge-trans
  forall x y z : Nat. ge x y = True => ge y z = True => ge x z = True
using
  ge-Z ge-S;
