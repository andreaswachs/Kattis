solve all@(wc : hc : ws : hs : _) = (wc - 2) >= ws && (hc - 2) >= hs

readInput :: String -> [Integer]
readInput = map read . words

writeOutput :: Bool -> String
writeOutput res = if res then "1" else "0"

main = interact (writeOutput . solve . readInput)

