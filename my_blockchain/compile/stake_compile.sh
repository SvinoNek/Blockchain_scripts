#!/bin/bash
cd /home/devcomp34/git/dragonstake
eosio-cpp -I include -o dragonstake.wasm src/dragonstake.cpp --abigen
cleos set contract dragonstake /home/devcomp34/git/dragonstake --abi dragonstake.abi -p dragonstake@active