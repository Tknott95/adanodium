module Main where

import System.IO
import System.Process

-- @NOTES
-- Pack flags with next item on list as flag val 
-- into a large list of strings for params.


main :: IO ()
main = do
  putStrLn "\n the Haskell API PAB replacement"

  procTesting

  putStrLn "\n Finished adanodium"


-- this one will return an IO String to then be used
grabUTXO :: String -> IO ()
grabUTXO  _addr= do
  let kout_flags = [_addr] :: [String]
  (_, Just kout, _, _) <- createProcess (proc "./scripts/grab_utxo.sh" kout_flags){ std_out = CreatePipe }
  k  <- hGetLine kout
  let ijk = k++"#0" :: String
  putStrLn $ "\n UTXO:    " ++ ijk
  putStrLn $ ijk

  putStr $ k++"#0"

-- just playing with modularities for now
queryTip :: IO ()
queryTip = do
  let kout_flags = ["--", "query", "tip", "--testnet-magic", "1097911063"] :: [String]
  (_, Just kout, _, _) <- createProcess (proc "cardano-cli" kout_flags){ std_out = CreatePipe }
  k  <- hGetContents kout
  putStrLn $ k

buildScKeys :: String -> IO ()
buildScKeys _keysName = do
  (_, Just kout, _, _) <- createProcess (proc "./scripts/build_sc_keys.sh" [_keysName]){ std_out = CreatePipe }
  k  <- hGetContents kout
  putStrLn $ k

procTesting :: IO ()
procTesting = do
  -- WITHOUT PIPING OUTPUT
  -- j <- createProcess (proc "cardano-cli" ["--version"])
  -- k <- createProcess (proc "cardano-cli" ["--", "query", "tip", "--testnet-magic", "1097911063"])

  -- WITH PIPING OUTPUT
  -- (_, Just iout, _, _) <- createProcess (proc "ls" []){ std_out = CreatePipe }
  (_, Just jout, _, _) <- createProcess (proc "cardano-cli" ["--version"]){ std_out = CreatePipe }

  queryTip
  buildScKeys "testing"
  buildScKeys "2525255325"
  buildScKeys "6486586865"
  grabUTXO "addr_test1qrpxufgw8y6dgyl758s37fcea2gm0pvfyrwnths06utp9tr2fgmkqt63xvatw9uufc4q9sdfrwt4hzmp54v6s9jlv2aq0ptj4v"

  j  <- hGetContents jout
  
  putStrLn j