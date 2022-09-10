-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

import Data.List (transpose)

solve :: [String] -> [String]
solve = map workOn 

workOn :: String -> String
workOn x = 
    let rootLen = isqrt $ length x
        -- Create blocks now of the new rows of characters
        charBlocks = map reverse $ toBlocks x rootLen
        -- Now we transpose the blocks, such that the new string
        -- is like multiple lanes of cars merging into one, with 
        -- one car from the front of all the lanes, 
        -- then move onto the second row of cars
        result = concat $ transpose charBlocks
    in result

toBlocks :: String -> Int -> [String]
toBlocks [] n = []
toBlocks xs n = take n xs : toBlocks (drop n xs) n

isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

readInput :: String -> [String]
readInput = lines . tail

writeOutput :: [String] -> String
writeOutput = unlines . tail

main = interact (writeOutput . solve . readInput)

