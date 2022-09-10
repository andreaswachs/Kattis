-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med
import Data.Char

solve xs = harshad xs

harshad :: Int -> Int
harshad n = if isHarshad n then n else harshad (n +1)

isHarshad :: Int -> Bool
isHarshad n =
    let digitSum = sumDigits $ show n
    in n `mod` digitSum == 0

sumDigits :: [Char] -> Int
sumDigits [] = 0
sumDigits (x:xs) = digitToInt x + sumDigits xs

readInput :: String -> Int
readInput = read

writeOutput :: Int -> String
writeOutput = show

main = interact (writeOutput . solve . readInput)

