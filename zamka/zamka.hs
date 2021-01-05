-- import Debug.Trace -- udkommenter til debug.
-- debug = flip trace -- hjælpefunktion til at printe med
import Data.List (group)
import Data.Char (digitToInt)

solve :: [Int] -> [Int]
solve (l:d:x:_) = [foundMin, foundMax]
    where values = filter (\i -> digitSum i == x) [l..d]
          foundMin = minimum values
          foundMax = maximum values

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show


readInput :: String -> [Int]
readInput = (map read) . words

writeOutput :: [Int] -> String
writeOutput = unlines . (map show)

main = interact (writeOutput . solve . readInput)

