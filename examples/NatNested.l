
data Nat = Z | S Nat;
data Bool = True | False;

ge : Nat -> Nat -> Bool
ge x y = case y of
    Z   -> True
  | S y -> (case x of
              Z   -> False
            | S x -> ge x y);

theorem ge-S
  forall y x : Nat. ge x y = True => ge (S x) y;

-- This might need a case-split in the first case
theorem ge-trans
  forall z y x : Nat. ge x y = True => ge y z = True => ge x z;
