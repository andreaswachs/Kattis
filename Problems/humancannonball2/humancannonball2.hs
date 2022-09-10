-- import Debug.Trace -- udkommenter til debug.
-- debug = flip trace -- hjælpefunktion til at printe med

solve :: [[Double]] -> [String]
solve [] = []
solve (x:xs) = result x : solve xs
    where result list =
            let g = 9.81
                v_0 = list !! 0
                theta = list !! 1
                x_1 = list !! 2
                h_1 = (list !! 3) + 1.0
                h_2 = (list !! 4) - 1.0
                t = x_1 / (v_0 * (cos (toRadians (theta))))
                y = v_0 * t * (sin (toRadians theta)) - 0.5 * g * t^2
            in if y > h_1 && y < h_2 then "Safe" else "Not Safe"
            --- Special thanks to: https://hackage.haskell.org/package/AC-Angle-1.0/docs/src/Data-Angle.html
toRadians :: (Floating x) => x -> x
toRadians x = x / 180 * pi

toDegrees :: (Floating x) => x -> x
toDegrees x = x / pi * 180

toBlocks :: [a] -> [[a]]
toBlocks [] = []
toBlocks xs = take 5 xs : toBlocks (drop 5 xs)

readInput :: String -> [[Double]]
readInput = toBlocks . tail . map (\x -> read x :: Double) . words

writeOutput :: [String] -> String
writeOutput = unlines

main = interact (writeOutput . solve . readInput)

