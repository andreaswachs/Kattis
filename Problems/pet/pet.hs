-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med
import Data.Maybe ( fromMaybe )
import Data.List ( elemIndex )

solve :: [[Integer]] -> [Integer]
solve xs = [n, winner]
    where pointSums = map sum xs
          winner = maximum pointSums
          n      = toInteger $ 1 + fromMaybe (- 1) (elemIndex winner pointSums)

readInput :: String -> [[Integer]]
readInput s = map (\x -> map read $ words x :: [Integer]) $ lines s

writeOutput :: [Integer] -> String
writeOutput i = unwords $ map show i

main = interact (writeOutput . solve . readInput)

