module Main where

import System.Process


main :: IO ()
main = do
  putStrLn "\n the Haskell API PAB replacement"
  i <- createProcess (proc "ls" [])
  j <- createProcess (proc "cardano-cli" ["--version"])
  k <- createProcess (proc "cardano-cli" ["--", "query", "tip", "--testnet-magic", "1097911063"])

  putStrLn "\n Finished adanodium"
