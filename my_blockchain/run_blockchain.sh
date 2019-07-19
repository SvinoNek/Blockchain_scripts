#!/bin/bash

#keosd &
sudo rm -r /home/devcomp34/.local/share/eosio/nodeos/data
pkill keosd
pkill nodeos
nodeos -e -p eosio --plugin eosio::producer_plugin --plugin eosio::chain_api_plugin --plugin eosio::http_plugin --access-control-allow-origin='*'--contracts-console --http-validate-host=false --verbose-http-errors >> nodeos.log 2>&1 &
sleep 4s
cleos wallet open
cat /home/devcomp34/DragonTokenMine/my_blockchain/default_wallet_password.txt | cleos wallet unlock
cleos create account eosio bob EOS8Maks8s71cBxp6eJ1QTn6a6dhsV7Xz91sAKccyZne4GkG9WNDo
cleos create account eosio alice EOS8Maks8s71cBxp6eJ1QTn6a6dhsV7Xz91sAKccyZne4GkG9WNDo
cleos create account eosio eosdragontkn EOS8Maks8s71cBxp6eJ1QTn6a6dhsV7Xz91sAKccyZne4GkG9WNDo
cleos create account eosio dragonstake EOS8Maks8s71cBxp6eJ1QTn6a6dhsV7Xz91sAKccyZne4GkG9WNDo
cleos set contract eosdragontkn /home/devcomp34/git/dragontoken --abi dragontoken.abi -p eosdragontkn@active
cleos set contract dragonstake  /home/devcomp34/git/dragonstake --abi dragonstake.abi -p dragonstake@active
cleos push action eosdragontkn create '[ "eosdragontkn", "1000000000.0000 DRAGON"]' -p eosdragontkn@active
cleos push action eosdragontkn issue '[ "alice", "100.0000 DRAGON", "memo" ]' -p eosdragontkn@active
cleos push action eosdragontkn issue '[ "bob", "100.0000 DRAGON", "memo" ]' -p eosdragontkn@active
cd /home/devcomp34/DragonTokenMine/my_blockchain/permissions
cleos set account permission bob active bob_permission.json owner -p bob
cleos set account permission alice active alice_permission.json owner -p alice
cd /home/devcomp34/DragonTokenMine/my_blockchain/
cleos set account permission dragonstake active --add-code