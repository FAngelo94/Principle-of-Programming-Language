--RECURSION
module Recursion where

take' :: (Num i, Ord i) => i -> [a] -> [a]  
take' n _  
    | n <= 0   = []  
take' _ []     = []  
take' n (x:xs) = x : take' (n-1) xs  

quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
 let smallerSorted = quicksort [a | a <- xs, a <= x]  
     biggerSorted = quicksort [a | a <- xs, a > x]  
 in  smallerSorted ++ [x] ++ biggerSorted  