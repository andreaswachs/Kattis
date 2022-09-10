-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

solve x = answer
  where k = x `mod` 4
        answer
          | k == 0 = "Even"
          | k == 2 = "Odd"
          | otherwise = "Either"
          
readInput :: String -> Int
readInput = read

writeOutput :: Int -> String
writeOutput = show

main = interact (solve . readInput)

