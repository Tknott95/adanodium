# adanodium

fire up http servers to play with the cardano node, including my very own cardano tooling, without launching a pab


cat ../keys/alwayssucceeds/alwayssucceeds_payment.addr | ./query_head.sh


``` Build Trans
 ./build_trans.sh $(cat ../keys/alwayssucceeds/alwayssucceeds_payment.addr)


./build_trans.sh $(cat ../keys/alwayssucceeds/alwayssucceeds_payment.addr) 4ca42623c58dd0efc52790ab20c200a67ed3f70f3e273b800884093a0ea83678#0  addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak   ../transactions/tx00/tx.build

./build_trans.sh \
  $(cat ../keys/alwayssucceeds/alwayssucceeds_payment.addr) \
  4ca42623c58dd0efc52790ab20c200a67ed3f70f3e273b800884093a0ea83678#0 \
  addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak \
  ../transactions/tx00/tx.build
```


``` Sign Trans
 ./sign_trans.sh ../transactions/tx00/tx.build  ../keys/alwayssucceeds/alwayssucceeds_payment.skey  ../transactions/tx00/tx.signed

./sign_trans.sh \
 ../transactions/tx00/tx.build \
 ../keys/alwayssucceeds/alwayssucceeds_payment.skey \
 ../transactions/tx00/tx.signed
```

``` Submit Trans
  ./submit_trans.sh ../transactions/tx00/tx.signed
```


# MY_UTXO=$(cardano-cli query utxo --address $(cat $addrFile) $MAGIC | grep " 0 " | sed -n 1p | egrep  -o '[a-z0-9]+' | head -1)


DEPRECATED: cat ../keys/alwayssucceeds/alwayssucceeds_payment.addr | ./build_trans.sh 