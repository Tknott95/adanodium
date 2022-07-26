{-# LANGUAGE DeriveGeneric #-}

module TxModels where

import GHC.Generics (Generic)

data TXInfo = TXInfo {
   scriptAddr :: String,
   utxoUsing :: String,
   payoutAddr :: String,
   txOutLoc :: String 
} deriving (Show, Generic)
