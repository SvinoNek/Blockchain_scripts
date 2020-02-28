#! bin/bash

cd /home/devcomp34/git/dragonaccounts/
eosio-cpp -I /home/devcomp34/git/dragonaccounts/include -o dragonaccounts.wasm /home/devcomp34/git/dragonaccounts/src/dragonaccounts.cpp --abigen
cleos set contract dragonaccnts  /home/devcomp34/git/dragonaccounts --abi dragonaccounts.abi -p dragonaccnts@active