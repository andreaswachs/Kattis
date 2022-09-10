-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

solve = product

readInput :: String -> [Integer]
readInput = (map read) . words

writeOutput :: Integer -> String
writeOutput = show

main = interact (writeOutput . solve . readInput)

