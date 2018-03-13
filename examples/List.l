
data Nat = Z | S Nat;

add : Nat -> Nat -> Nat
add n m = case n of
    Z   -> m
  | S n -> S (add n m);

double : Nat -> Nat
double n = case n of
    Z   -> Z
  | S n -> S (S (double n));

lemma add-S
  forall n m : Nat. add n (S m) = S (add n m);

lemma add-S-S
  forall n m : Nat. add (S n) (S m) = S (S (add n m))
using
  add-S;

theorem double-add
  forall n : Nat. double n = add n n
using
  add-S-S;

theorem add-comm
  forall n m : Nat. add n m = add m n
using
  add-S add-Z;

lemma add-Z
  forall n : Nat. add n Z = n;

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

length : NatList -> Nat
length xs = case xs of
    Nil -> Z
  | Cons x xs -> S (length xs);

lemma length-cons
  forall xs ys : NatList. forall z : Nat. length (append xs (Cons z ys)) = S (length (append xs ys));

theorem append-add-length
  forall xs ys : NatList. length (append xs ys) = add (length xs) (length ys);

theorem append-flip-length
  forall xs ys : NatList. length (append xs ys) = length (append ys xs)
using
  append-nil length-cons;

theorem length-double
  forall xs : NatList. length (append xs xs) = double (length xs)
using
  append-add-length double-add;

lemma length-reverse
  forall xs : NatList. length (reverse xs) = length xs
using
  append-add-length add-comm;
