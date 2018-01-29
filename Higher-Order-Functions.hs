--Higher order functions
compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100  
--apply function f twice time to x
applyTwice :: (a->a)->a->a
applyTwice f x = f (f x)

flip' :: (a -> b -> c) -> b -> a -> c  
flip' f y x = f x y  
--lambda function to sum 2 at each elements in the vector
exampleLambda :: (Num a)=>[a]->[a]
exampleLambda a=map (\x -> x+2) a