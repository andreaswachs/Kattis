-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times


solve r n = do

    return 0

readNumber:: a -> Int
readNumber = do
    input <- getLine
    let number = read input :: Int
    return number

--loadNumbers n xs = do


main = do
    --input <- getLine
    let number = readNumber
    putStrLn ("You input: " ++ (show number))
    {-let numbers = map read $ words input :: [Int]
    let r = head numbers -- number of hotel rooms total
    let n = last numbers -- number of occupied hotel rooms
    -}
    return 0

