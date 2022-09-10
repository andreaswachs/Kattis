import Debug.Trace
debug = flip trace

-- “:)”, “;)”, “:-)”, or “;-)”

-- Represents in which state something is looked for (eyes -> looking for eyes)
-- Integer: position
-- Integer: beginning position of a smiley (if starting to detect it)
-- [Integer]: smiley positions
data State = Eyes Integer Integer [Integer] | NoseOrMouth Integer Integer [Integer]


readNext :: String -> State -> [Integer]
readNext [] state = case state of
    Eyes _ _ ns -> ns `debug` "exited in eyes state"
    NoseOrMouth _ _ ns -> ns `debug` "exited in NoseOrMouth state"
readNext (x : xs) state =
    case state of
        Eyes pos beginning ns -> case x of 
            ':' -> readNext xs (NoseOrMouth (pos + 1) pos ns) `debug` ("Read open eye, switch to NoseOrMouth state" ++ posReport pos ++ bReport beginning)
            ';' -> readNext xs (NoseOrMouth (pos + 1) pos ns) `debug` ("Read wink eye, switch to NoseOrMouth State" ++ posReport pos ++ bReport beginning)
            _   -> readNext xs (Eyes        (pos + 1) (pos + 1) ns) `debug` ("Read something else, continue in Eyes state" ++ posReport pos ++ bReport beginning)
        NoseOrMouth pos beginning ns -> case x of
            ')' -> readNext xs (Eyes        (pos + 1) (pos + 1) (beginning : ns)) `debug` ("Read mouth, registering smiley, reset to Eyes state" ++ posReport pos ++ bReport beginning)
            '-' -> readNext xs (NoseOrMouth (pos + 1) beginning ns) `debug` ("Read nose, continuing in NoseOrMouth state" ++ posReport pos ++ bReport beginning)
            ':' -> readNext xs (NoseOrMouth (pos + 1) pos ns) `debug` ("Read eyes again, reset in NoseOrMouth state" ++ posReport pos ++ bReport beginning)
            _   -> readNext xs (Eyes        (pos + 1) (pos + 1) ns) `debug` ("Read something else, return to Eyes state" ++ posReport pos ++ bReport beginning)

solve :: String -> [Integer]
solve xs = reverse $ readNext xs (Eyes 0 0 [])

posReport :: Integer -> String
posReport pos = "[POS: " ++ show pos ++ "]"

bReport :: Integer -> String
bReport b = "[BEG: " ++ show b ++ "]"

writeOutput :: [Integer] -> String
writeOutput = unlines . map show

main = interact (writeOutput . solve)

