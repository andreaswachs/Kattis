-- import Debug.Trace -- udkommenter til debug.
-- debug = flip trace -- hjælpefunktion til at printe med
import Data.Time.Calendar
import Data.Time.Format
solve :: [Int] -> String
solve xs = formatTime defaultTimeLocale "%A" (fromGregorian 2009 month day)
    where day = xs !! 0
          month = xs !! 1

readInput :: String -> [Int]
readInput = (map read) . words

main = interact (solve . readInput)

