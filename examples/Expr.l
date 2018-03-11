{- Standard Nat theory -}
data Nat = Z | S Nat;

add : Nat -> Nat -> Nat
add n m = case n of
    Z   -> m
  | S n -> S (add n m);

lemma add-Z
  forall n : Nat. add n Z = n;

lemma add-S
  forall n m : Nat. add n (S m) = S (add n m);

theorem add-comm
  forall n m : Nat. add n m = add m n
using
  add-S add-Z;

{- Expression trees for natural numbers -}
data Expr = Num Nat | Add Expr Expr | AddOne Expr;

eval : Expr -> Nat
eval e = case e of
    Num n    -> n
  | Add l r  -> add (eval l) (eval r)
  | AddOne e -> S (eval e);

{- Abstract machine -}
data Prog = LOAD Nat Prog
          | ADD Prog
          | HALT;

data Stack = Empty
           | Push Nat Stack;

data State = State Prog Stack;

run : State -> State
run st = case st of
    State HALT s                      -> State HALT s
  | State (LOAD n p) s                -> run (State p (Push n s))
  | State (ADD p) (Push m (Push n s)) -> run (State p (Push (add n m) s));

compileCont : Expr -> Prog -> Prog
compileCont e cont = case e of
    Num n    -> LOAD n cont
  | Add l r  -> compileCont l (compileCont r (ADD cont))
  | AddOne e -> compileCont e (LOAD (S Z) (ADD cont));

compile : Expr -> Prog 
compile e = compileCont e HALT;

runExpr : Expr -> State
runExpr e = run (State (compile e) Empty);

lemma compiler-strong
  forall e : Expr. forall s : Stack. forall p : Prog.
    run (State (compileCont e p) s) = run (State p (Push (eval e) s))
using add-comm;

theorem compiler-correct
  forall e : Expr. runExpr e = State HALT (Push (eval e) Empty)
using compiler-strong;
