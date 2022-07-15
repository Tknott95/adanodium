module Main where

import System.IO
import System.Process


import NodeProcs (buildFullTX, grabUTXO, queryTip, buildScKeys) 

-- @NOTES
-- Pack flags with next item on list as flag val 
-- into a large list of strings for params.

-- data TXInfo String String String String
data TXInfo = TXInfo {
   scriptAddr :: String,
   utxoUsing :: String,
   payoutAddr :: String,
   txOutLoc :: String 
} deriving Show

main :: IO ()
main = do
  putStrLn "\n to be disclosed later"

  procTesting

  putStrLn "\n Finished adanodium"



procTesting :: IO ()
procTesting = do
  -- WITHOUT PIPING OUTPUT
  -- j <- createProcess (proc "cardano-cli" ["--version"])
  -- k <- createProcess (proc "cardano-cli" ["--", "query", "tip", "--testnet-magic", "1097911063"])

  -- WITH PIPING OUTPUT
  -- (_, Just iout, _, _) <- createProcess (proc "ls" []){ std_out = CreatePipe }
  -- (_, Just jout, _, _) <- createProcess (proc "cardano-cli" ["--version"]){ std_out = CreatePipe }
  -- j  <- hGetContents jout
  -- putStrLn j

  utxo_using <- grabUTXO "addr_test1qrpxufgw8y6dgyl758s37fcea2gm0pvfyrwnths06utp9tr2fgmkqt63xvatw9uufc4q9sdfrwt4hzmp54v6s9jlv2aq0ptj4v"

  let scrAddr = "addr_test1qrpxufgw8y6dgyl758s37fcea2gm0pvfyrwnths06utp9tr2fgmkqt63xvatw9uufc4q9sdfrwt4hzmp54v6s9jlv2aq0ptj4v"
  let payoutAddr="addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak"
  let txOutLoc="./transactions/tx00"

  let newTX = TXInfo {
    scriptAddr = scrAddr,
    utxoUsing = utxo_using,
    payoutAddr = payoutAddr,
    txOutLoc = txOutLoc
  }

  let ijk = show ijk;
  print $ show newTX

  buildFullTX scrAddr utxo_using payoutAddr txOutLoc


  -- queryTip
  -- buildScKeys "testing"
  buildScKeys "2525255325"
  buildScKeys "6486586865"

 
  putStrLn utxo_using