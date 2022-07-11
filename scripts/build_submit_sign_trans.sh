#!/bin/sh

sc_addr=$(cat ../keys/alwayssucceeds/alwayssucceeds_payment.addr)
utxo_using=$(./grab_utxo.sh $sc_addr)"#0"

echo $utxo_using

# ./build_trans.sh \
#   $sc_addr\
#   4ca42623c58dd0efc52790ab20c200a67ed3f70f3e273b800884093a0ea83678#0 \
#   addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak \
#   ../transactions/tx00/tx.build
