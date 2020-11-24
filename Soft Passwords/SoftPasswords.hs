-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times
import Data.Char as C
import Data.String as S

flipCase input = do
    let flipCharCase c
            | C.isUpper c   = toLower c
            | otherwise     = toUpper c
    let result = map flipCharCase input
    return result

checkEnds s p =
    let getTheDifferentChar
            | s == p               = '1' -- to return true if s == p
            | (head s) == (head p) = last p
            | otherwise            = head p
    in C.isNumber getTheDifferentChar

main = do
    s <- getLine
    p <- getLine
    let flippedCase = S.toString (flipCase p)

    if s == p then putStrLn("Yes")
    else if flippedCase == s then putStrLn("Yes")
    else if checkEnds s p then putStrLn("Yes")
    else putStrLn("No")

    return 0