#!/bin/sh

sc_skey=./keys/alwayssucceeds/alwayssucceeds_payment.skey
tx_out_loc=./transactions/tx00

echo "SC_ADDR USING: " $sc_addr

./scripts/sign_trans.sh \
  $tx_out_loc"/tx.build" \
  $sc_skey \
  $tx_out_loc"/tx.signed"


echo "TX SIGNED:  $tx_out_loc/tx.signed"


./scripts/submit_trans.sh $tx_out_loc"/tx.signed"
