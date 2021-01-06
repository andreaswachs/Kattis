-- import Debug.Trace -- udkommenter til debug.
-- debug = flip trace -- hjælpefunktion til at printe med

solve:: [String] -> [Int]
solve xs = map length xs

readInput :: String -> [String]
readInput = tail . lines

writeOutput :: [Int] -> String
writeOutput = unlines . (map show)

main = interact (writeOutput . solve . readInput)

