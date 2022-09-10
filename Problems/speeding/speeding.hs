solve :: [Integer] -> Integer
solve xs = maximum $ greatestSpeed pairs
    where pairs = toPairs xs

toPairs :: [Integer] -> [(Integer, Integer)]
toPairs xs = if length xs > 1 then (x, y) : toPairs rest else []
    where x = xs !! 0
          y = xs !! 1
          rest = drop 2 xs

greatestSpeed :: [(Integer, Integer)] -> [Integer]
greatestSpeed xs = if length xs > 1 then speed : greatestSpeed (tail xs) else []
    where (t0, d0) = xs !! 0
          (t1, d1) = xs !! 1
          speed = (d1 - d0) `div` (t1 - t0)

readInput :: String -> [Integer]
readInput input = tail (map read (words input))

writeOutput :: Integer -> String
writeOutput n = unlines [show n]

main = interact (writeOutput . solve . readInput)

