-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

solve :: [Int] -> [String]
solve xs = [ show x ++ endingFor x | x <- xs]
    where endingFor i
            | odd i     = " is odd"
            | otherwise = " is even"

readInput :: String -> [Int]
readInput x= map read (tail (lines x)) :: [Int]

writeOutput :: [String] -> String
writeOutput = unlines

main = interact (writeOutput . solve . readInput)

