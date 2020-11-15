-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times



main = do
    input <- getLine
    let n = (read input :: Integer)
    if even n then do
                putStrLn "Alice"
                putStrLn "1"
            else
                putStrLn "Bob"
    return 0

