--FUNCTION
--In this class we have different ways to create a function

--Pattern matching
sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5"

factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)  

sumNumbers :: (Num a) => a -> a -> a
sumNumbers a b = a+b

manageList :: (Num a) => [a] -> (String) -> a
manageList l "h" = head l
manageList l "l" = last l
manageList l x = (-1)
--implemented length using recursion
length' :: (Num b) => [a] -> b  
length' [] = 0  
length' (_:xs) = 1 + length' xs 

    capital :: String -> String  
    capital "" = "Empty string, whoops!"  
    capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]  
	
