-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times

solve :: (Fractional a, Eq a) => [a] -> a -> a -> a
solve [] atBats slugNumeratorSum = slugNumeratorSum / atBats 
solve (x:xs) atBats slugNumeratorSum
    | x == -1.0   = solve xs (atBats - 1.0) slugNumeratorSum
    | otherwise = solve xs atBats (slugNumeratorSum + x)

main = do
    input <- getLine
    let atBats = read input :: Float
    
    input <- getLine
    let inputAsNum = map read $ words input :: [Float]
    let res = solve inputAsNum atBats 0
    print res
    
    return 0


