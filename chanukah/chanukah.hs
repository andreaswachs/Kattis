-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times
import System.IO ( isEOF )
import Control.Monad ( unless )
import Text.Printf (PrintfArg,  printf )


solve :: (Show a1, Show a2, Integral a2, PrintfArg a2, PrintfArg a1) => a1 -> a2 -> IO ()
solve k n = do
    let n' = calculate n
    printf "%d %d\n" k n'
    checkNext

calculate :: Integral a => a -> a
calculate n = ((n * (n + 1)) `div` 2) + n


getNext :: IO ()
getNext = do
    input <- getLine
    let numbers = map read $ words input :: [Int]
    let k = head numbers
    let n = last numbers
    solve k n
    return ()

checkNext :: IO ()
checkNext = do
    isDone <- isEOF
    unless isDone getNext

    
main :: IO Integer
main = do
    input <- getLine
    checkNext
    return 0


