--20/07/2017
data Color = Yellow | Blue
data Ttree a = Node Color a(Ttree a)(Ttree a)(Ttree a)

instance Functor Ttree where
    fmap f (Node col v a b c) = Node col (f v)(fmap f a)(fmap f b)(fmap f c)

instance Foldable Ttree where
  foldr f v (Node col d a b c)=
    let v1 = foldr f v c
        v2 = foldr f v1 b
        v3 = foldr f v2 a
    in f d v3

yellowSubTrees::[a]->