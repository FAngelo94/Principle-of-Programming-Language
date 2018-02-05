--ESERCIZI ESAMI
--01/09/2017
data Itree a = Node (Itree a) a (Itree a)

instance (Show a) => Show (Itree a) where
    show (Node l v r) = "Node (... " ++ show v ++ " ...)"

list2Itree :: [a] -> Itree a
list2Itree (x1:xs) = Node (list2Itree xs) x1 (list2Itree xs)

constItree v = list2Itree [v, v ..]

instance Functor Itree where
    fmap f (Node l v r) = Node (fmap f l) (f v) (fmap f r)

data Tree a = Leaf a | Branch (Tree a) a (Tree a) deriving Show
takeLevels :: Int -> Itree a -> Tree a
takeLevels 0 (Node _ v _) = Leaf v
takeLevels k (Node l v r) = Branch (takeLevels (k-1) l) v (takeLevels (k-1) r)

--applyAtLevel :: (a -> a) -> (Int -> Bool) -> Itree a -> Itree a
--applyAtLevel f pred tree = applyAtLevel' f pred tree 0
--                where applyAtLevel' f pred (Node l v r) level = Node 
--                     (applyAtLevel' f pred l (level+1))
--               (if pred level then f v else v)
--                   (applyAtLevel' f pred r (level+1))

--12/02/2014
data Tree14 a= Node14 a | Branch14 a [Tree a] deriving (Show)

visit :: (Tree14 a) => a -> a
visit (Node14

cd("C:/Users/Angelo/Desktop/Angelo/UNIVERSITA/magistrale/secondo anno/primo semestre/principle of programming language/esercitazioni/Repository/Principle-of-Programming-Language").