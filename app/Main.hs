module Main where

import System.Process


main :: IO ()
main = do
  putStrLn "\n the Haskell API PAB replacement"
  r <- createProcess (proc "ls" [])
  putStrLn "\n Finished adanodium"
