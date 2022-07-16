module TxModel where

data TXInfo = TXInfo {
   scriptAddr :: String,
   utxoUsing :: String,
   payoutAddr :: String,
   txOutLoc :: String 
} deriving Show
