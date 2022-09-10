{-# LANGUAGE FlexibleContexts #-}
-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times
import Control.Monad (unless)
import System.IO (isEOF)
import Debug.Trace ( trace )
debug :: c -> String -> c
debug = flip trace

solve :: [Int] -> IO ()
solve xs = do
     print (2 * (maximum xs - minimum xs))
     getNext

getNext :: IO ()
getNext = do
    isDone <- isEOF
    unless isDone $ do
        input <- getLine
        input <- getLine
        let nums = map read $ words input :: [Int]
        solve nums

main = do
    input <- getLine
    getNext
    return 0


