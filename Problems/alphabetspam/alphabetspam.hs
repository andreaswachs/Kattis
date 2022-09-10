-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- Note: removed readInput as we're working on the raw string itself
import Data.Char ( isLower, isUpper )
import Data.Ratio((%))
import Text.Printf (printf)

solve :: [Char] -> (Integer, Integer, Integer, Integer) -> Integer -> [Double]
solve [] all@(w, l, u, s) n = map (ratioOf n) (toList all)
solve (x:xs) (w, l, u, s) n
    | x == '_'  = solve xs (succ w, l, u, s) n'
    | isLower x = solve xs (w, succ l, u, s) n'
    | isUpper x = solve xs (w, l, succ u, s) n'
    | otherwise = solve xs (w, l, u, succ s) n'
    where n' = succ n

toList :: (a, a, a, a) -> [a]
toList (a, b, c, d) = [a, b, c, d]

ratioOf :: Fractional a => Integer -> Integer -> a
ratioOf n xs = fromRational (xs % n)

readInput :: String -> [Double]
readInput xs = solve xs (0, 0, 0, 0) 0

writeOutput :: [Double] -> IO ()
writeOutput [] = return ()
writeOutput (x:xs) = do
    printf "%.15f\n" x  
    writeOutput xs
    return ()

main :: IO ()
main = do
    input <- getLine
    let parsedData = readInput input
    writeOutput parsedData
    return ()

