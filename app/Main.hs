{-# LANGUAGE TypeApplications #-}

module Main where

import Control.Monad.Identity

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
