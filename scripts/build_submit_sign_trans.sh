#!/bin/sh

sc_addr=$(cat ../keys/alwayssucceeds/alwayssucceeds_payment.addr)
utxo_using=$(./grab_utxo.sh $sc_addr)"#0"

# @TODO - make this dynamic - this is X4Wallet137
payout_addr=addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak

echo "SC_ADDR USING: " $sc_addr
echo "UTXO USING:  " $utxo_using

./build_trans.sh \
  $sc_addr\
  $utxo_using \
  $payout_addr \
  ../transactions/tx00/tx.build
