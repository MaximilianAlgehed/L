
data Bool = True | False;

and : Bool -> Bool -> Bool;
and a b = case a of
    True  -> b
  | False -> False;

lemma and-false
  forall a : Bool. and a False = False;

lemma and-true
  forall a : Bool. and a True = a;

lemma and-implies
  forall a b : Bool. and a b = True => a = True
using
  and-false and-true;
