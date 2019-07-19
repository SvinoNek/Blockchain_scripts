#!/bin/bash
cd /home/devcomp34/git/dragontoken
eosio-cpp -I include -o dragontoken.wasm src/eosio.token.cpp --abigen
cleos set contract eosdragontkn /home/devcomp34/git/dragontoken --abi dragontoken.abi -p eosdragontkn@active