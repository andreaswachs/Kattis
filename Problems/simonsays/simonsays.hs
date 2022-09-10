-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

import Data.List (isPrefixOf)

solve:: [String] -> [String]
solve input = [drop 10 x | x <- input, "Simon says" `isPrefixOf` x]

readInput :: String -> [String]
readInput = tail . lines

writeOutput :: [String] -> String
writeOutput = unlines

main = interact (writeOutput . solve . readInput)

