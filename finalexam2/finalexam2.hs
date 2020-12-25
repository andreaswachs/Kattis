-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times
import System.IO (isEOF)


getNextInput = do
    input <- getLine
    return (read input :: Char)

{-
solve [] n = do
    isDone <- isEOF
    if not isDone then do
        solve getNextInput n
    else return ()
solve (x:[]) n = do
    isDone <- isEOF
    if not isDone then do
        let c = getNextInput
        if c == x then do solve (c : x) (succ n)
        else do 
            solve (c : x) n
            return ()
solve all@(x:xs) n = do
    isDone <- isEOF
    if not isDone then do
        let c = getNextInput
        let newList = inputAsChar:all
        if c == x then solve newList (succ n)
        else solve newList n
    else do
        print n
        -}



solve :: (Enum a, Show a) => String -> a -> IO ()
solve lastChar n = do
    isDone <- isEOF
    if not isDone then do
        input <- getLine
        if input == lastChar then 
            solve input (succ n)
        else 
            solve input n
    else
        print n


main = do
    input <- getLine
    let n = read input :: Int
    input <- getLine
    solve input 0
    return 0


