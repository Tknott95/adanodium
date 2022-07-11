#!/bin/sh

addr_using=$1

cardano-cli query utxo --address addr_using $MAGIC | grep " 0 " | sed -n 1p | egrep  -o '[a-z0-9]+' | head -1
