-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med
import Data.Char
import Data.List

solve :: [String] -> [String]
solve [] = []
solve (x:xs) = answer : solve xs
  where lowercaseLine = map toLower x
        answer = case findString "problem" lowercaseLine of Just _ -> "yes"
                                                            Nothing -> "no"

findString :: (Eq a) => [a] -> [a] -> Maybe Int
findString search str = findIndex (isPrefixOf search) (tails str)

readInput :: String -> [String]
readInput = lines

writeOutput :: [String] -> String
writeOutput = unlines

main = interact (writeOutput . solve . readInput)

