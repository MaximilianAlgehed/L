
data Nat = Z | S Nat;

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

reverse : NatList -> NatList
reverse xs = case xs of
    Nil       -> Nil
  | Cons x xs -> append (reverse xs) (Cons x Nil);

theorem reverse-append
  forall xs ys : NatList.
    reverse (append xs ys) = append (reverse ys) (reverse xs)
using
  append-assoc append-nil;

theorem reverse-reverse
  forall xs : NatList.
    reverse (reverse xs) = xs
using
  reverse-append;

quickReverse : NatList -> NatList -> NatList
quickReverse xs ys = case xs of
    Nil       -> ys
  | Cons x xs -> quickReverse xs (Cons x ys);

lemma reverse-quickReverse-strong
  forall xs ys : NatList.
    append (reverse xs) ys = quickReverse xs ys
using
  append-assoc;

theorem reverse-quickReverse
  forall xs : NatList.
    reverse xs = quickReverse xs Nil
using
  reverse-quickReverse-strong;
