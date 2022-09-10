-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

solve :: [[Integer]] -> [Integer]
solve [] = []
solve (x:xs) = solve' x : solve xs
    where solve' nums = 
            -- we will move through nums and working on two numbers at the same time 
            -- two adjacent numbers that is and moving forward through the list 
            -- we check that if the population has more than doubled since last year, then
            -- then we put the difference of the rightmost number and the double of last years population
            -- in the new list.
            -- we then sum the differences to find the lower bound of how many Turtles that are not native
            let computed = zipWith (\z y -> if y - (2 * z) > 0 then y - (2 * z) else 0) nums (tail nums)
            in sum computed

readInput :: String -> [[Integer]]
readInput i = tail (map ((\ x -> map read x :: [Integer]) . words) (lines i))

writeOutput :: [Integer] -> String
writeOutput = unlines . (map show)

main = interact (writeOutput . solve . readInput)

