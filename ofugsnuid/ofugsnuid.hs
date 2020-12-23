-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times

import System.IO ( isEOF)
import Control.Monad (unless)
    

solve :: [String] -> IO ()
solve xs = do
    isDone <- isEOF
    if not isDone then do
        input <- getLine
        solve (input : xs)
    else do
        putStr (unlines xs)

main = do
    input <- getLine
    solve []
    return 0


