
data Nat = Z | S Nat;
data Bool = True | False;

ge : Nat -> Nat -> Bool
ge x y = case y of
    Z   -> True
  | S y -> (case x of
              Z   -> False
            | S x -> ge x y);

lemma ge-Z
  forall x : Nat. ge Z x => x = Z;

-- Don't know how to prove this :S
lemma ge-S
  forall y x : Nat. ge x y => ge (S x) y
using
  ge-Z;

theorem ge-trans
  forall x y z : Nat. ge x y => ge y z => ge x z
using
  ge-Z ge-S;
