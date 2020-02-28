#!bin/bash

pkill keosd
pkill cleos
pkill keosd
pkill cleos

cd /home/devcomp34/blockhain_scripts/my_blockchain/
rm /home/devcomp34/eosio-wallet/ -rf  || true
cleos wallet create --file /home/devcomp34/blockhain_scripts/my_blockchain/password.txt
cleos wallet open
cat /home/devcomp34/blockhain_scripts/my_blockchain/password.txt | cleos wallet unlock
cleos wallet create_key
cleos wallet import --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3    
echo PUT PUBLIC KEY INTO public_key.txt