-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times
import Data.Char
-- Defining custom Algebraic data type for the problem
data Action = Enter Int | Leave Int deriving (Show, Read)

-- Importing Data.Char for this to work
capitalize :: [Char] -> [Char]
capitalize [] = []
capitalize (x:xs) = toUpper x : map toLower xs

solve:: (Num t, Ord t, Enum t) => Int -> t -> IO ()
solve l x =
    let solve' n (people, denied) = do
        if n < x then do
            input <- getLine
            let inputData = read (capitalize input) :: Action
            solve' (succ n) (case inputData of
                                Enter value
                                    | (people + value) > l  -> (people, (succ denied))
                                    | otherwise             -> ((people + value), denied)
                                Leave value -> (people - value, denied))
        else do putStrLn (show denied)
    in solve' 0 (0, 0) 

main = do
    input <- getLine
    let setup = map read $ words input :: [Int]
    let l = head setup -- Max num of people allowed on the terrace
    let x = last setup -- Num of actions
    solve l x
    return 0

