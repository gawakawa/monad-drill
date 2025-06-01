{-# LANGUAGE TypeApplications #-}

module Main where

import Control.Monad.Identity
import Data.Either (fromRight)
import Data.Maybe (fromMaybe, listToMaybe)

main :: IO ()
main = putStrLn "Hello, Haskell!"

identity11 :: IO ()
identity11 = print @Int $ runIdentity $ do
    Identity 2

identity12 :: IO ()
identity12 = print $ runIdentity $ do
    Identity False

identity13 :: IO ()
identity13 = print @Int $ runIdentity $ do
    Identity $ 1 + 2

identity14 :: IO ()
identity14 = print @(Maybe ()) $ runIdentity $ do
    Identity Nothing

identity15 :: IO ()
identity15 = print @(Identity Int) $ runIdentity $ do
    Identity $ Identity 3

identity16 :: IO ()
identity16 = print @(Identity (Maybe ())) $ runIdentity $ do
    Identity $ Identity Nothing

identity17 :: IO ()
identity17 = print $ runIdentity $ do
    Identity "hello"

identity18 :: IO ()
identity18 = print @(Either () Bool) $ runIdentity $ do
    Identity $ Right True

identity19 :: IO ()
identity19 = print @Int $ runIdentity $ do
    b <- Identity 6
    Identity $ b + 2

maybe11 :: IO ()
maybe11 = print @Int $ fromMaybe 0 $ do
    Just 2

maybe12 :: IO ()
maybe12 = print $ fromMaybe False $ do
    Just False

maybe13 :: IO ()
maybe13 = print @Int $ fromMaybe 0 $ do
    Just $ 1 + 2

maybe14 :: IO ()
maybe14 = print $ fromMaybe () $ do
    Nothing

maybe15 :: IO ()
maybe15 = print @(Maybe Int) $ fromMaybe Nothing $ do
    Just $ Just 3

maybe16 :: IO ()
maybe16 = print @(Maybe (Maybe ())) $ fromMaybe Nothing $ do
    Just $ Just Nothing

maybe17 :: IO ()
maybe17 = print $ fromMaybe "" $ do
    Just "hello"

maybe18 :: IO ()
maybe18 = print $ fromMaybe (Left False) $ do
    Just $ Right True

maybe19 :: IO ()
maybe19 = print @Int $ fromMaybe 0 $ do
    b <- Just 6
    Just $ b + 2

either11 :: IO ()
either11 = print @Int $ fromRight 0 $ do
    Right 2

either12 :: IO ()
either12 = print $ fromRight False $ do
    Right False

either13 :: IO ()
either13 = print @Int $ fromRight 0 $ do
    Right $ 1 + 2

either14 :: IO ()
either14 = print @(Maybe ()) $ fromRight Nothing $ do
    Right Nothing

either15 :: IO ()
either15 = print @(Either () Int) $ fromRight (Left ()) $ do
    Right $ Right 3

either16 :: IO ()
either16 = print @(Either () (Maybe ())) $ fromRight (Left ()) $ do
    Right $ Right Nothing

either17 :: IO ()
either17 = print $ fromRight "" $ do
    Right "hello"

either18 :: IO ()
either18 = print $ fromRight (Left ()) $ do
    Right $ Right True

either19 :: IO ()
either19 = print @Int $ fromRight 0 $ do
    b <- Right 6
    Right $ b + 2

list11 :: IO ()
list11 = print @Int $ fromMaybe 0 $ listToMaybe $ do
    [2]

list12 :: IO ()
list12 = print $ fromMaybe False $ listToMaybe $ do
    [False]

list13 :: IO ()
list13 = print @Int $ fromMaybe 0 $ listToMaybe $ do
    [1 + 2]

list14 :: IO ()
list14 = print @(Maybe ()) $ fromMaybe Nothing $ listToMaybe $ do
    [Nothing]

list15 :: IO ()
list15 = print @[Int] $ fromMaybe [] $ listToMaybe $ do
    [[3]]

list16 :: IO ()
list16 = print @[Maybe ()] $ fromMaybe [] $ listToMaybe $ do
    [[Nothing]]

list17 :: IO ()
list17 = print $ fromMaybe "" $ listToMaybe $ do
    ["hello"]

list18 :: IO ()
list18 = print $ fromMaybe [] $ listToMaybe $ do
    [[True]]

list19 :: IO ()
list19 = print @Int $ fromMaybe 0 $ listToMaybe $ do
    b <- [6]
    [b + 2]
