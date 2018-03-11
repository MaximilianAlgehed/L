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

{- A little bit of List theory -}
data NatList = Nil | Cons Nat NatList;

append : NatList -> NatList -> NatList
append xs ys = case xs of
    Nil       -> ys
  | Cons x xs -> Cons x (append xs ys);

lemma append-nil
  forall xs : NatList.
    append xs Nil = xs;

theorem append-assoc
  forall xs ys zs : NatList.
    append xs (append ys zs) = append (append xs ys) zs;

{- Mising Nat and List theory -}
listSum : NatList -> Nat
listSum xs = case xs of
    Nil -> Z
  | Cons n xs -> add n (listSum xs);

lemma append-sum
  forall xs ys : NatList.
    listSum (append xs ys) = add (listSum xs) (listSum ys)
using
  add-assoc;

lemma append-sum-flip
  forall xs ys : NatList.
    listSum (append xs ys) = listSum (append ys xs)
using
  append-sum add-comm;

{- Mixing Tree and List theory -}
flatten : NatTree -> NatList
flatten t = case t of
    Leaf       -> Nil
  | Fork n l r -> append (flatten l) (append (Cons n Nil) (flatten r));

theorem flatten-mirror-sum
  forall t : NatTree.
    listSum (flatten t) = listSum (flatten (mirror t))
using
  append-sum append-sum-flip;
