-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med

-- brug debug sådan: ____KODE____ `debug` "tekst til konsol"
-- brug :set +s i GHCI for execution times



main :: IO Integer
main = do
    input <- getLine
    let nums = map read $ words input :: [Float]
    let h = head nums
    let v = last nums
    let ladder = h / sin (v*pi/180.0)
    print (ceiling ladder)
    return 0


