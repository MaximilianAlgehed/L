{- Tree theory -}
data NatTree = Leaf
             | Fork Nat NatTree NatTree;

mirror : NatTree -> NatTree
mirror t = case t of
    Leaf       -> Leaf
  | Fork n l r -> Fork n (mirror r) (mirror l);

theorem mirror-mirror
  forall t : NatTree. mirror (mirror t) = t;

{- Nat theory -}
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

{- Mixing Tree and Nat theory -}
treeSum : NatTree -> Nat
treeSum t = case t of
    Leaf       -> Z
  | Fork n l r -> add n (add (treeSum l) (treeSum r));

theorem mirror-sum
  forall t : NatTree. treeSum t = treeSum (mirror t)
using
  add-comm;
