#!/bin/bash
cd /home/devcomp34/git/dragontoken
eosio-cpp -I include -o dragontoken.wasm src/eosio.token.cpp --abigen
cleos set contract eosdragontkn /home/devcomp34/git/dragontoken --abi dragontoken.abi -p eosdragontkn@active


#cleos -u https://api.kylin.alohaeos.com/v1/chain/get_info set contract testtokenglb /home/devcomp34/dragontoken/ --abi dragontoken.abi -p testtokenglb@active

