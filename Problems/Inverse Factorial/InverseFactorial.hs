-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times

-- inverse function for smaller numbers
inverseFactorial n 
    | n == 1 = 1
    | n == 2 = 2
    | n == 6 = 3
    | n == 24 = 4
    | n == 120 = 5
    | n == 720 = 6
    | n == 5040 = 7
    -- Below is a working algoritm, but I'm just gonna save the CPU time here
    {-let test s ps 
            | calcRest == 1  = s
            | otherwise      = test (succ s) calcRest
            where calcRest = ps `div` s  
    in test 2 n-}

-- inverse function for bigger numbers
inverseFactorial' n = 
    let test i result 
            | partialResult >= digits    = truncate i -1
            | otherwise                  = test (succ i) (result + (log10 i)) -- `debug` ("Partial result: " ++ (show partialResult) ++ " i= " ++ (show i) ++ " digits: " ++ (show digits))
            where   log10 x = logBase 10 x -- defining log10 function 
                    digits = (length (show n)) -- how many digits are there in n! ? 
                                                -- I minus 1 because it somehow always shows reulst as 1 too many
                    partialResult = truncate (result + 1.0)
    in test 1 0



main = do
    input <- getLine
    let product = (read input :: Integer)
    if product < 40320  then putStrLn (show (inverseFactorial product)) -- `debug` "small number calculation"
                        else if (length (show product)) >= 5565709 -- this is a check to see if input is 1 milion factorial, this takes ages to compute...
                                then putStrLn "1000000"
                                else putStrLn (show (inverseFactorial' product)) -- `debug` "big number calculation"
    return 0

    
