{-# LANGUAGE TypeApplications #-}

module Main where

import Control.Monad.Identity
import Data.Maybe (fromMaybe)

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
