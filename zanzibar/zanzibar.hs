-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

solve :: [[Integer]] -> [Integer]
solve [] = []
solve (x:xs) = solve' x : solve xs
    where solve' nums = 
            let computed = zipWith (\z y -> if y - (2 * z) > 0 then y - (2 * z) else 0) nums (tail nums)
            in sum computed

readInput :: String -> [[Integer]]
readInput i = tail (map ((\ x -> map read x :: [Integer]) . words) (lines i))

writeOutput :: [Integer] -> String
writeOutput = unlines . (map show)

main = interact (writeOutput . solve . readInput)

