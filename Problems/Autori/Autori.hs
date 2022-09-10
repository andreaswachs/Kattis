-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times

split :: Eq a => a -> [a] -> [[a]]
split d [] = []
split d s = x : split d (drop 1 y)
    where (x, y) = span (/= d) s


getInitials s [] = reverse s
getInitials s xs = getInitials ((head (head xs)) : s) (tail xs)


main = do
    input <- getLine
    putStrLn (getInitials "" (split '-' input))
    return 0

