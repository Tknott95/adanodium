module Main where

import System.IO
import System.Process


import NodeProcs (buildFullTX, grabUTXO, queryTip, buildScKeys, buildTX, signTX, submitTX) 

import TxModels(TXInfo (..))

-- @NOTES
-- Pack flags with next item on list as flag val 
-- into a large list of strings for params.

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
  -- let scrAddr = "addr_test1qrpxufgw8y6dgyl758s37fcea2gm0pvfyrwnths06utp9tr2fgmkqt63xvatw9uufc4q9sdfrwt4hzmp54v6s9jlv2aq0ptj4v"
  -- let payoutAddr="addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak"
  -- let txOutLoc="./transactions/tx00"

  -- this is an old addr and the plutus script to such is only existent on github archives. 
  let newTX = TXInfo{
    scriptAddr = "addr_test1qrpxufgw8y6dgyl758s37fcea2gm0pvfyrwnths06utp9tr2fgmkqt63xvatw9uufc4q9sdfrwt4hzmp54v6s9jlv2aq0ptj4v",
    utxoUsing = utxo_using,
    payoutAddr = "addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak",
    txOutLoc = "./transactions/tx00"
  }

  let newTXAltV2 = TXInfo{
    scriptAddr = "addr_test1qrkdtsmvwl87u89arnhpjvxz2kp4gkhpk7lh0de4uzz03wyelc24kl7x4c5kay2rv4r6lz4ugu5yjaeraawcdgzztg8s6l3x4x",
    utxoUsing = utxo_using,
    payoutAddr = "addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak",
    txOutLoc = "txAltTesting00"
    -- above will be a folder name with this new proc split out - for now
  }
  --  txOutLoc = "txAltTesting00"

  print $ show newTX

  -- buildFullTX scrAddr utxo_using payoutAddr txOutLoc
  -- buildFullTX newTXAltV2

  buildTX newTXAltV2
  -- signTX  newTXAltV2
  -- submitTX newTXAltV2

  -- queryTip
  -- buildScKeys "testing"
  buildScKeys "2525255325"
  buildScKeys "6486586865"

 
  putStrLn utxo_using