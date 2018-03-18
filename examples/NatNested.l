
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

-- The case split lemma
lemma split
  forall y : Nat.
  forall f g : Nat -> Bool.
    f Z = g Z => (\x : Nat. f (S x)) = (\x : Nat. g (S x)) => f y = g y;

-- Don't know how to prove this without function extensionality :S 
lemma ge-S
  forall y x : Nat. ge x y => ge (S x) y
using
  ge-Z split;

theorem ge-trans
  forall x y z : Nat. ge x y => ge y z => ge x z
using
  ge-Z ge-S;
