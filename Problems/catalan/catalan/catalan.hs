solve :: [Integer] -> [Integer]
solve xs = map catalan $ tail xs

catalan :: Integer -> Integer
catalan n = (2 * n) `choose` n `div` (n + 1) --2 * n `choose` n `div` n + 1

choose :: Integer -> Integer -> Integer
choose n 0 = 1
choose 0 k = 0
choose n k = choose (n-1) (k-1) * n `div` k

readInput :: String -> [Integer]
readInput = (map read) . words

writeOutput :: [Integer] -> String
writeOutput = unlines . (map show)

main = interact (writeOutput . solve . readInput)
