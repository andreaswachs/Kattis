import Data.List
import Debug.Trace
-- import Debug.Trace -- udkommenter til debug.
-- debug = flip trace -- hjælpefunktion til at printe med

-- jeg er ved at lave problemer med at jeg får skåret antal gæster væk for senere
-- iterationer ved `cases`.
-- derudover skal jeg finde på en god måde at generere output på med : "case #n: <svar>"


solve :: [Integer] -> [Integer]
solve [] = []
solve xs = trace ("Guests:" ++ show (guests !! 0)) singleGuest : solve (drop (fromIntegral numOfGuests + 1) xs)
  where numOfGuests = head xs
        guests = sort $ drop 1 xs
        singleGuest = findOdd guests

findOdd :: [Integer] -> Integer
findOdd xs
  | length xs == 1 = head xs
  | not hasPair = head xs
  | otherwise = findOdd $ filter (/= head xs) xs
    where rest = drop 1 xs
          hasPair = head xs `elem` rest


readInput :: String -> [Integer]
readInput input = trace ("I'm reading something: " ++ input) tail (map read $ words input :: [Integer])

formatted :: [String] -> Integer -> [String]
formatted [] _ = []
formatted ns n = ("Case #" ++ show n ++ ": " ++ head ns) : formatted (drop 1 ns) (succ n)

writeOutput :: [Integer] -> String
writeOutput xs = unlines $ formatted asString 1
  where asString = map show xs
        originalLength = length asString
main = interact (writeOutput . solve . readInput)

