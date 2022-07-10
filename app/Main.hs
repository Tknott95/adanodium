module Main where

import System.IO
import System.Process

-- @NOTES
-- Pack flags with next item on list as flag val 
-- into a large list of strings for params.


main :: IO ()
main = do
  putStrLn "\n the Haskell API PAB replacement"

  proc_testing

  putStrLn "\n Finished adanodium"



-- just playing with modularities for now
query_tip :: IO ()
query_tip = do
  let kout_flags = ["--", "query", "tip", "--testnet-magic", "1097911063"] :: [String]
  (_, Just kout, _, _) <- createProcess (proc "cardano-cli" kout_flags){ std_out = CreatePipe }
  k  <- hGetContents kout
  putStrLn $ k

build_sc_keys :: String -> IO ()
build_sc_keys _keysName = do
  (_, Just kout, _, _) <- createProcess (proc "./scripts/build_sc_keys.sh" [_keysName]){ std_out = CreatePipe }
  k  <- hGetContents kout
  putStrLn $ k

proc_testing :: IO ()
proc_testing = do
  -- WITHOUT PIPING OUTPUT
  -- j <- createProcess (proc "cardano-cli" ["--version"])
  -- k <- createProcess (proc "cardano-cli" ["--", "query", "tip", "--testnet-magic", "1097911063"])

  -- WITH PIPING OUTPUT
  -- (_, Just iout, _, _) <- createProcess (proc "ls" []){ std_out = CreatePipe }
  (_, Just jout, _, _) <- createProcess (proc "cardano-cli" ["--version"]){ std_out = CreatePipe }

  query_tip
  build_sc_keys "testing"

  j  <- hGetContents jout
  
  putStrLn $ j