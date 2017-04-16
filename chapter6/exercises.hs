-- charpter6/exercises.hs
module Exercises6 where

-- Chapter Exercises

-- Does it typecheck?

-- 1. No it doesn't, fixed by having typeclass Person derive Show
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2. No it doesn't compile, because woot doesn't implement Eq
data Mood = Blah | Woot deriving (Show, Eq)

settleDown :: Mood -> Mood
settleDown x = if x == Woot
                 then Blah
                 else x

-- 3.
-- a) What are acceptable inputs to settleDown?
--  Blah or Woot. members of the Mood typeclass
-- b) What will happen if you try to run settleDown 9?
--  It will be a type error because the Mood typeclass doesn't implement an instance of Num
-- c) What will happen if you try to run Blah > Woot
--  It will be a type error because Mood doesn't implememt an Ord instance and methods.

-- 4. I think it does typecheck
-- I was pretty much guessing. It looks like the partial application of the
-- data constructor is a function waiting for an Object in order to return
-- a Sentence.
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 :: Object -> Sentence
s1 = Sentence "dogs" "drool"

s2 :: Sentence
s2 = Sentence "Julie" "loves" "dogs"

-- Given a datatype declaration, what can we do?

data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)

-- 1.
-- phew = Papu "chases" True
-- Doesn't type check because Papu expects an instance of Rocks and Yeah not
-- String and Bool
--
-- 2.
-- truth = Papu (Rocks "chomskydoz")
--              (Yeah True`)
-- Yes it works.
--
-- 3.
-- equalityForAll :: Papu -> Papu -> Bool
-- equalityForAll p p' = p == p'
-- Yes it works
--
-- 4.
-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'
-- No, Papu doesn't have instance of Ord

-- Type-Kwon-do

-- 1.

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f x y = f x == y

-- 2.
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f x y = f y + fromIntegral x
