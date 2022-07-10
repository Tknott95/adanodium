import System.Process

module Main where

main :: IO ()
main = do
  putStrLn "\n the Haskell API PAB replacement"
  r <- createProcess (proc "ls" [])
  putStrLn "\n Finished adanodium"
