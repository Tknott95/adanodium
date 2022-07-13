module NodeProcs(buildFullTX, grabUTXO, queryTip, buildScKeys) where


import System.IO
import System.Process

 -- @TODO
  -- build out tulLTX into modular steps for signing
  -- create types instead of passing in so many params

  -- $sc_addr\
  -- $utxo_using \
  -- $payout_addr \
  -- $tx_out_loc"/tx.build"
buildFullTX :: String -> String -> String -> String -> IO ()
buildFullTX _scriptAddr _utxoUsing _payoutAddr _txOutFileLoc = do
  let kout_flags = [ _scriptAddr, _utxoUsing, _payoutAddr, _txOutFileLoc] :: [String]

  putStrLn $ concat kout_flags 

  (_, Just kout, _, _) <- createProcess (proc "./scripts/build_submit_sign_trans.sh" kout_flags){ std_out = CreatePipe }
  print kout
  
  k  <- hGetContents kout

  print k

  -- CHECK RETURN AND LOG ERRORS ACCORDINGLY

  -- if null k
  --   then 
  --     print "ERROR"
  --   else print k
  putStrLn k

-- this one will return an IO String to then be used
grabUTXO :: String -> IO String
grabUTXO  _addr= do
  let kout_flags = [_addr] :: [String]
  (_, Just kout, _, _) <- createProcess (proc "./scripts/grab_utxo.sh" kout_flags){ std_out = CreatePipe }
  k  <- hGetLine kout
  let utxo = k++"#0" :: String
  putStrLn $ "\n UTXO:    " ++ utxo
  return utxo

-- just playing with modularities for now
queryTip :: IO ()
queryTip = do
  let kout_flags = ["--", "query", "tip", "--testnet-magic", "1097911063"] :: [String]
  (_, Just kout, _, _) <- createProcess (proc "cardano-cli" kout_flags){ std_out = CreatePipe }
  k  <- hGetContents kout
  putStrLn k

buildScKeys :: String -> IO ()
buildScKeys _keysName = do
  (_, Just kout, _, _) <- createProcess (proc "./scripts/build_sc_keys.sh" [_keysName]){ std_out = CreatePipe }
  k  <- hGetContents kout
  putStrLn k