-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at prInte med
solve :: [Int] -> [String]
solve (n:w:h:xs) = map (toAnswer) xs
  where toAnswer x
          | x <= intSquareRoot (w^2 + h^2) = "DA"
          | otherwise = "NE"

intSquareRoot :: Int -> Int
intSquareRoot n = aux n
  where
    aux x
      | x * x > n = aux (x - 1)
      | otherwise = x

readInput :: String -> [Int]
readInput = (map read) . words

writeOutput :: [String] -> String
writeOutput = unlines 

main = interact (writeOutput . solve . readInput)

