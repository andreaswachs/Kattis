-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

import Data.List as L

solve :: (Ord a, Num a) => [a] -> [a]
solve xs = [res]
    where sortedList = L.sort xs
          n0 = sortedList !! 0
          n3 = sortedList !! 2
          res = n0 * n3

readInput :: String -> [Integer]
readInput = (map read) . words

writeOutput :: [Integer] -> String
writeOutput = unlines . (map show)

main = interact (writeOutput . solve . readInput)

