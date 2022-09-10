-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times



main = do
    input <- getLine
    let n = (length input) - 2
    putStr "h"
    putStr (take (n * 2) (repeat 'e'))
    putStrLn "y"
    return 0

