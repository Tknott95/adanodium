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



proc_testing :: IO ()
proc_testing = do
  -- WITHOUT PIPING OUTPUT
  -- i <- createProcess (proc "ls" [])
  -- j <- createProcess (proc "cardano-cli" ["--version"])
  -- k <- createProcess (proc "cardano-cli" ["--", "query", "tip", "--testnet-magic", "1097911063"])

  -- WITH PIPING OUTPUT
  (_, Just iout, _, _) <- createProcess (proc "ls" []){ std_out = CreatePipe }
  (_, Just jout, _, _) <- createProcess (proc "cardano-cli" ["--version"]){ std_out = CreatePipe }

  -- (_, Just kout, _, _) <- createProcess (proc "cardano-cli" ["--", "query", "tip", "--testnet-magic", "1097911063"]){ std_out = CreatePipe }
  let test_flags = ["--", "query", "tip", "--testnet-magic", "1097911063"] :: [String]
  (_, Just kout, _, _) <- createProcess (proc "cardano-cli" test_flags){ std_out = CreatePipe }


  i  <- hGetContents iout
  j  <- hGetContents jout
  k  <- hGetContents kout
  -- print $ i
  -- print $ j
  -- print $ k
  putStrLn $ i
  putStrLn $ j
  putStrLn $ k