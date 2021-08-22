{-# LANGUAGE FlexibleContexts #-}
import Debug.Trace -- udkommenter til debug. 
debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times)


split :: String -> Char -> [String]
split [] _ = [""]
split (c:cs) d | c == d  = "" : rest
             | otherwise = (c : head rest) : tail rest
    where rest = split cs d

findChar :: Char -> [Char] -> Bool
findChar _ [] = False
findChar c (x:xs)
    | c == x    = True
    | otherwise = findChar c xs


calcRange :: Num a => (a, a) -> a
calcRange (x, y) = abs(x - y) + 1

calc :: Foldable t => [Char] -> t a -> Int
calc x = do
    let xn = map read $ split x '-' :: [Int]
    let a = xn !! 0
    let b = xn !! 1
    return length [a..b]


compute :: (Foldable t, Num (t a -> Int)) => [Char] -> t a -> Int
compute x
    | findChar '-' x    = calc x
    | otherwise         = 1


main = do
    input <- getLine
    let x = [compute x | x <- split input ';']
    print $ sum x
    return 0


