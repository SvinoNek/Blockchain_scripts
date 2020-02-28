#!/bin/bash

# compile the contract
eosio-cpp -I include -o eosio.token.wasm src/eosio.token.cpp --abigen
