-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med
import Text.Printf (PrintfArg,  printf )

solve :: [Integer] -> [Integer]
solve xs = newTime
    where h = head xs
          m = last xs
          newTime = [findHour h m, findMinutes m]
            
findMinutes :: Integer -> Integer
findMinutes m = m' `mod` 60
    where m' = m - 45

findHour :: Integer -> Integer -> Integer
findHour h m = h' `mod` 24
    where h'
            | m < 45    = h - 1
            | otherwise = h

readInput :: String -> [Integer]
readInput = (map read) . words

main = do
    input <- getLine
    let res = solve $ readInput input
    printf "%0.1d %.01d" (head res) (last res)
    return ()

