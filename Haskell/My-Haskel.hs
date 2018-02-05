doubleMe x = x + x -- my first function
doubleUs x y = doubleMe x + doubleMe y
--negative number must put between parenthesis
tryCondition x = (if x>0 then "positivo" else "negativo")
--Variable can have strange name
conanO'Brien = "It's a-me, Conan O'Brien!"
--let is used like in scheme
--let lostNumbers = [4,8,15,16,23,42] I can't use let here
lostNumbers = [4,8,15,10,23,42]
--Join 2 list (vector number or string)
joinTwoList x y = x ++ y
--Add something to a list
addHeadList x l = x:l
--add an element by index
getByIndex index list = list !! index
--ranges
giveMeRanges x start step = [start, step..x]
--cycle
takePortionCycle l x = take x (cycle l)
--repeat
--repeatSomething r n = take n (repeat r) --equal
repeatSomething r n = replicate n r
--list comprehension
takeOnlyOdd list = [x | x <- list, odd x]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']] 
--tuples
takeRightTriangles x = [(a,b,c) | c <- [1..x], b <- [1..c], a <- [1..b], a^2+b^2==c^2]

--SLIDES PROF
mylength :: [a]->Integer
mylength [] = 0
mylength (x:xs) = 1 + mylength xs