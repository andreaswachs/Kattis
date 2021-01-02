-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

import Data.List

solve :: String -> Int
solve xs = result
    where result = 
            let blocks = toBlocks xs
                changeNeededList = map (stringDistance "PER") blocks 
            in sum changeNeededList        
    

toBlocks :: String -> [String]
toBlocks [] = []
toBlocks xs = take 3 xs : toBlocks (drop 3 xs)

stringDistance :: String -> String -> Int
stringDistance [] [] = 0
stringDistance (x:xs) (y:ys)
    | x == y    = 0 + next
    | otherwise = 1 + next
    where next = stringDistance xs ys

readInput :: String -> String
readInput = filter (/= '\n')

writeOutput :: Int -> String
writeOutput = show

main = interact (writeOutput . solve . readInput)

