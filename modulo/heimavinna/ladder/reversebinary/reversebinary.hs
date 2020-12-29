{-# LANGUAGE BinaryLiterals #-}
import Numeric (showIntAtBase, showInt)
import Data.Char (intToDigit, digitToInt)
import Text.Printf (printf)

digits :: Integer -> [Int]
digits = map digitToInt . show

convert :: [Int] -> Int
convert [] = 0
convert (x : xs) = x + 2 * convert xs

main = do
    input <- getLine
    let n = read input :: Int
    let asBin = reverse $ showIntAtBase 2 intToDigit n ""
    let asBinInt = read asBin :: Integer
    let binDigits = digits asBinInt
    let revBinAsDec = convert binDigits
    print revBinAsDec
    return 0


