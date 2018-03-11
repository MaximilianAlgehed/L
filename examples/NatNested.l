
data Nat = Z | S Nat;
data Bool = True | False;

gt : Nat -> Nat -> Bool
gt x y = case x of
  S x -> (case y of
       Z   -> True
     | S y -> gt x y)
  | Z -> False;

isZero : Nat -> Bool
isZero x = case x of
    Z   -> True
  | S x -> False;

or : Bool -> Bool -> Bool
or x y = case x of
    True  -> True
  | False -> y;

not : Bool -> Bool
not x = case x of
    True -> False
  | False -> True;

and : Bool -> Bool -> Bool
and x y = not (or x y);

implies : Bool -> Bool -> Bool
implies x y = case x of
    False -> True
  | True  -> y;

theorem gt-Z
  forall x : Nat. or (gt x Z) (isZero x);

-- This might need a case-split in the first case
theorem gt-trans
  forall z x y : Nat. implies (and (gt x y) (gt y z)) (gt x z);
