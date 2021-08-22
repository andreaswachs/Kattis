-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

solve :: [String] -> [String]
solve [] = []
solve (x:y:xs) = x : y : solve' x y : solve xs
    where solve' str1 str2 = (zipWith (\x y -> if x == y then '.' else '*') str1  str2) ++ "\n"

readInput :: String -> [String]
readInput = tail . lines

writeOutput :: [String] -> String
writeOutput = unlines

main = interact (writeOutput . solve . readInput)