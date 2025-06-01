module Main where

import Control.Exception (assert)
import Control.Monad.Identity
import Data.Either (fromRight)
import Data.Maybe (fromMaybe, isNothing, listToMaybe)

main :: IO ()
main = putStrLn "Enjoy Monad!"

identity11 :: Int
identity11 =
    runIdentity $
        Identity 2

testIdentity11 :: Int
testIdentity11 = assert (identity11 == 2) identity11

identity12 :: Bool
identity12 =
    runIdentity $
        Identity False

testIdentity12 :: Bool
testIdentity12 = assert (not identity12) identity12

identity13 :: Int
identity13 =
    runIdentity $
        Identity $
            1 + 2

testIdentity13 :: Int
testIdentity13 = assert (identity13 == 3) identity13

identity14 :: Maybe ()
identity14 =
    runIdentity $
        Identity Nothing

testIdentity14 :: Maybe ()
testIdentity14 = assert (isNothing identity14) identity14

identity15 :: Identity Int
identity15 =
    runIdentity $
        Identity $
            Identity 3

testIdentity15 :: Identity Int
testIdentity15 = assert (identity15 == Identity 3) identity15

identity16 :: Identity (Maybe ())
identity16 =
    runIdentity $
        Identity $
            Identity Nothing

testIdentity16 :: Identity (Maybe ())
testIdentity16 = assert (identity16 == Identity Nothing) identity16

identity17 :: String
identity17 =
    runIdentity $
        Identity "hello"

testIdentity17 :: String
testIdentity17 = assert (identity17 == "hello") identity17

identity18 :: Either () Bool
identity18 =
    runIdentity $
        Identity $
            Right True

testIdentity18 :: Either () Bool
testIdentity18 = assert (identity18 == Right True) identity18

identity19 :: Int
identity19 =
    runIdentity $ do
        b <- Identity 6
        Identity $ b + 2

testIdentity19 :: Int
testIdentity19 = assert (identity19 == 8) identity19

maybe11 :: Int
maybe11 =
    fromMaybe 0 $
        Just 2

testMaybe11 :: Int
testMaybe11 = assert (maybe11 == 2) maybe11

maybe12 :: Bool
maybe12 =
    fromMaybe False $
        Just False

testMaybe12 :: Bool
testMaybe12 = assert (not maybe12) maybe12

maybe13 :: Int
maybe13 =
    fromMaybe 0 $
        Just $
            1 + 2

testMaybe13 :: Int
testMaybe13 = assert (maybe13 == 3) maybe13

maybe14 :: ()
maybe14 =
    fromMaybe
        ()
        Nothing

testMaybe14 :: ()
testMaybe14 = assert (maybe14 == ()) maybe14

maybe15 :: Maybe Int
maybe15 =
    fromMaybe Nothing $
        Just $
            Just 3

testMaybe15 :: Maybe Int
testMaybe15 = assert (maybe15 == Just 3) maybe15

maybe16 :: Maybe (Maybe ())
maybe16 =
    fromMaybe Nothing $
        Just $
            Just Nothing

testMaybe16 :: Maybe (Maybe ())
testMaybe16 = assert (maybe16 == Just Nothing) maybe16

maybe17 :: String
maybe17 =
    fromMaybe "" $
        Just "hello"

testMaybe17 :: String
testMaybe17 = assert (maybe17 == "hello") maybe17

maybe18 :: Either Bool Bool
maybe18 =
    fromMaybe (Left False) $
        Just $
            Right True

testMaybe18 :: Either Bool Bool
testMaybe18 = assert (maybe18 == Right True) maybe18

maybe19 :: Int
maybe19 =
    fromMaybe 0 $ do
        b <- Just 6
        Just $ b + 2

testMaybe19 :: Int
testMaybe19 = assert (maybe19 == 8) maybe19

either11 :: Int
either11 =
    fromRight 0 $
        Right 2

testEither11 :: Int
testEither11 = assert (either11 == 2) either11

either12 :: Bool
either12 =
    fromRight False $
        Right False

testEither12 :: Bool
testEither12 = assert (not either12) either12

either13 :: Int
either13 =
    fromRight 0 $
        Right $
            1 + 2

testEither13 :: Int
testEither13 = assert (either13 == 3) either13

either14 :: Maybe ()
either14 =
    fromRight Nothing $
        Right Nothing

testEither14 :: Maybe ()
testEither14 = assert (isNothing either14) either14

either15 :: Either () Int
either15 =
    fromRight (Left ()) $
        Right $
            Right 3

testEither15 :: Either () Int
testEither15 = assert (either15 == Right 3) either15

either16 :: Either () (Maybe ())
either16 =
    fromRight (Left ()) $
        Right $
            Right Nothing

testEither16 :: Either () (Maybe ())
testEither16 = assert (either16 == Right Nothing) either16

either17 :: String
either17 =
    fromRight "" $
        Right "hello"

testEither17 :: String
testEither17 = assert (either17 == "hello") either17

either18 :: Either () Bool
either18 =
    fromRight (Left ()) $
        Right $
            Right True

testEither18 :: Either () Bool
testEither18 = assert (either18 == Right True) either18

either19 :: Int
either19 =
    fromRight 0 $ do
        b <- Right 6
        Right $ b + 2

testEither19 :: Int
testEither19 = assert (either19 == 8) either19

list11 :: Int
list11 =
    fromMaybe 0 $
        listToMaybe
            [2]

testList11 :: Int
testList11 = assert (list11 == 2) list11

list12 :: Bool
list12 =
    fromMaybe False $
        listToMaybe
            [False]

testList12 :: Bool
testList12 = assert (not list12) list12

list13 :: Int
list13 =
    fromMaybe 0 $
        listToMaybe
            [1 + 2]

testList13 :: Int
testList13 = assert (list13 == 3) list13

list14 :: Maybe ()
list14 =
    fromMaybe Nothing $
        listToMaybe
            [Nothing]

testList14 :: Maybe ()
testList14 = assert (isNothing list14) list14

list15 :: [Int]
list15 =
    fromMaybe [] $
        listToMaybe
            [[3]]

testList15 :: [Int]
testList15 = assert (list15 == [3]) list15

list16 :: [Maybe ()]
list16 =
    fromMaybe [] $
        listToMaybe
            [[Nothing]]

testList16 :: [Maybe ()]
testList16 = assert (list16 == [Nothing]) list16

list17 :: String
list17 =
    fromMaybe "" $
        listToMaybe
            ["hello"]

testList17 :: String
testList17 = assert (list17 == "hello") list17

list18 :: [Bool]
list18 =
    fromMaybe [] $
        listToMaybe
            [[True]]

testList18 :: [Bool]
testList18 = assert (list18 == [True]) list18

list19 :: Int
list19 =
    fromMaybe 0 $ listToMaybe $ do
        b <- [6]
        [b + 2]

testList19 :: Int
testList19 = assert (list19 == 8) list19

