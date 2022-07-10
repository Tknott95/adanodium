#!/bin/sh

read input_piped_in

cardano-cli query utxo --address $input_piped_in $MAGIC

