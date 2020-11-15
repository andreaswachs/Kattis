-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times

-- https://www.reddit.com/r/haskell/comments/809a1r/splitting_problem/
split c xs = case break (== c) xs of
    (y, _ : ys) -> y : split c ys
    (y, []) -> [y]


solveProblem n =
    let solve count names = do
            if count <= n then do
                input <- getLine
                let actions = split ' ' input
                let name = last actions 
                if (head actions) == "entry" then do
                    putStr (name ++ " entered")
                    if (last actions) `elem` names then do
                        putStrLn " (ANOMALY)"
                        solve (succ count) names
                    else do
                        putStrLn ""
                        solve (succ count) (names ++ [name])
                else do
                    putStr (name ++ " exited")
                    if (last actions) `elem` names then do
                        putStrLn ""
                        solve (succ count) (filter (/= name) names)
                    else do
                        putStrLn " (ANOMALY)"
                        solve (succ count) names
            else return 0
    in solve 1 []

main = do
    input <- getLine
    let n = (read input :: Integer)
    solveProblem n
    return 0

