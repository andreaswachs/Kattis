{-# LANGUAGE OverloadedStrings #-}
-- import Debug.Trace -- udkommenter til debug. 
-- debug = flip trace -- hjælpefunktion til at printe med
import Data.List

data BinaryTree a = EmptyTree | Node a (BinaryTree a) (BinaryTree a)

data Person = Person
  { name :: String
  , likeness :: Integer
  , birthdayHash :: Integer
  }

-- Thanks to https://gist.github.com/mmagm/2793684
treeInsert item EmptyTree = Node item EmptyTree EmptyTree
treeInsert item (Node a left right)
    | birthdayHash item == birthdayHash a = if likeness item > likeness a then Node item left right else Node a left right
    | birthdayHash item < birthdayHash a = Node a left (treeInsert item right)
    | birthdayHash item > birthdayHash a = Node a (treeInsert item left) right

flattenTree EmptyTree = []
flattenTree (Node a left right) = flattenTree left ++ [a] ++ flattenTree right


-- Thanks to an user on SO, forgot to save URL
splitOn :: Char -> String -> [String]
splitOn _ "" = []
splitOn delimiter str = 
    let (start, rest) = break (== delimiter) str
        (_, remain) = span (== delimiter) rest
     in start : splitOn delimiter remain

solve :: [String] -> [String]
solve [] = []
solve (_ : xs) = finishedList
    where people = toPersons xs
          tree = insertAll EmptyTree people
          asList = flattenTree tree
          listOfNames = sort $ map name asList
          listLength = show $ length listOfNames
          finishedList = listLength  : listOfNames

insertAll :: BinaryTree Person -> [Person] -> BinaryTree Person
insertAll tree people = Prelude.foldl (flip treeInsert) tree people

toPersons :: [String] -> [Person]
toPersons [] = []
toPersons (x : xs) = person : toPersons xs
    where explodedText = words x
          personName = head explodedText
          personLikeness = read (explodedText !! 1) :: Integer
          splitDate = splitOn '/' (explodedText !! 2)
          day = read (head splitDate) :: Integer
          month = read (splitDate !! 1) :: Integer
          dateHash = calculateDateHash day month
          person = Person {name = personName, likeness = personLikeness, birthdayHash = dateHash}

calculateDateHash :: Integer -> Integer -> Integer
calculateDateHash day month =
    day * 5 + month * 997

readInput :: String -> [String]
readInput = lines

writeOutput :: [String] -> String
writeOutput = unlines

main = interact (writeOutput . solve . readInput)

