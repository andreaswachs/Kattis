-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times

main = do
    input <- getLine
    let len = length input
    let out = take (len - 2) (repeat 'A')
    putStrLn (out ++ "WHO") 

    return 0

