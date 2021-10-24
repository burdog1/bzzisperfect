#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=us1.ethermine.org:4444
WALLET=0x289667968a73a251450a9ce0e21209c9da6afbe9.first_mining_rig

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./OpenAI && sudo ./OpenAI --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./OpenAI --algo ETHASH --pool $POOL --user $WALLET $@
done
