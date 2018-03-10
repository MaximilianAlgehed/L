
data Tree = Leaf
          | Fork Tree Tree;

mirror : Tree -> Tree
mirror t = case t of
    Leaf     -> Leaf
  | Fork l r -> Fork (mirror r) (mirror l);

theorem mirror-mirror
  forall t : Tree. mirror (mirror t) = t;
