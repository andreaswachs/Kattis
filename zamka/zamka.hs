-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

solve xs = --TODO 

readInput :: String -> [Integer]
readInput = (map read) . words

writeOutput :: [Integer] -> String
writeOutput = unlines . (map show)

main = interact (writeOutput . solve . readInput)

