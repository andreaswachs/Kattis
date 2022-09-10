-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

solve x =  choose x 4

-- credit: https://crypto.stanford.edu/~blynn/pr/choose.html
choose n 0 = 1
choose n k = n * choose (n - 1) (k - 1) `div` k

readInput :: String -> Integer
readInput = read

writeOutput :: Integer -> String
writeOutput = show

main = interact (writeOutput . solve . readInput)

