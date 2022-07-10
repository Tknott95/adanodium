module Main where

import System.Process


main :: IO ()
main = do
  putStrLn "\n the Haskell API PAB replacement"
  i <- createProcess (proc "ls" [])
  j <- createProcess (proc "cardano-cli" ["--version"])

  putStrLn "\n Finished adanodium"
