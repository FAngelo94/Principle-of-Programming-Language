module Function where
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

mysum :: (Num a) => [a] -> a  
mysum [] = 0  
mysum (x:xs) = x + mysum xs 

capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
--Stupid method that return the same number
decrement :: (Integral a) => a -> a
decrement 0 = 0
decrement a= 1 + decrement (a-1)
--End Pattern matching

--Guards
bmiTell :: (RealFloat a) => a -> String  
bmiTell bmi  
 | bmi <= 18.5 = "You're underweight, you emo, you!"  
 | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
 | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
 | otherwise   = "You're a whale, congratulations!"  

bmiTell2 :: (RealFloat a) => a -> a -> String  
bmiTell2 weight height  
  | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
  | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
  | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
  | otherwise                   = "You're a whale, congratulations!"  

myCompare :: (Ord a) => a -> a -> Ordering  
myCompare a b  
 | a > b     = GT  
 | a == b    = EQ  
 | otherwise = LT 
--End Guards

--Where!
bmiTellW :: (RealFloat a) => a -> a -> String  
bmiTellW weight height  
 | bmi <= skinny = "You're underweight, you emo, you!"  
 | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
 | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
 | otherwise     = "You're a whale, congratulations!"  
 where bmi = weight / height ^ 2  
       (skinny, normal, fat) = (18.5, 25.0, 30.0) 
confront :: (RealFloat a) => a -> a -> String
confront a b 
 | a2 <= b2 = "bella="
 | otherwise = "brutta=" 
 where a2 = a+2
       b2 = b+2
       c=a+b
--End Where

--Let it be
cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
 let sideArea = 2 * pi * r * h  
     topArea = pi * r ^2  
 in  sideArea + 2 * topArea
 
square :: (RealFloat a) => a -> a -> a -> a
square b h d =
 let area = b * h * d
 in area / d
 --End Let
 
 --Case Expression
head' :: [a] -> a  
head' xs = case xs of [] -> error "No head for empty lists!"  
                      (x:_) -> x 
 --End Case Expression