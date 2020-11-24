-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times

solve numbers
    | 0 `elem` (init numbers)               = putStrLn("NO")
    | (last numbers) > (sum (init numbers)) = putStrLn("NO")
    | (last numbers) < 3                    = putStrLn("NO")
    | otherwise                             = putStrLn("YES")

main = do
    input <- getLine
    let numbers = map read $ words input :: [Int]
    solve numbers
    return 0

