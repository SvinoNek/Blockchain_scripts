#!/bin/bash

pkill nodeos

rm -rf $HOME/.local/share/eosio/nodeos || true
nodeos -e -p eosio --plugin eosio::producer_plugin --plugin eosio::chain_api_plugin --plugin eosio::http_plugin --access-control-allow-origin='*'--contracts-console --http-validate-host=false --verbose-http-errors >> nodeos.log 2>&1 &
sleep 4s

cleos create account eosio bob `cat /home/devcomp34/blockhain_scripts/my_blockchain/public_key.txt`
cleos create account eosio alice `cat /home/devcomp34/blockhain_scripts/my_blockchain/public_key.txt`
cleos create account eosio eosdragontkn `cat /home/devcomp34/blockhain_scripts/my_blockchain/public_key.txt`
cleos create account eosio dragonstake `cat /home/devcomp34/blockhain_scripts/my_blockchain/public_key.txt`
cleos create account eosio dragonaccnts  `cat /home/devcomp34/blockhain_scripts/my_blockchain/public_key.txt`
cleos set contract eosdragontkn /home/devcomp34/git/dragontoken --abi dragontoken.abi -p eosdragontkn@active
cleos set contract dragonstake  /home/devcomp34/git/dragonstake --abi dragonstake.abi -p dragonstake@active
cleos set contract dragonaccnts  /home/devcomp34/git/dragonaccounts --abi dragonaccounts.abi -p dragonaccnts@active
cleos push action eosdragontkn create '[ "eosdragontkn", "1000000000.0000 DRAGON"]' -p eosdragontkn@active
cleos push action eosdragontkn issue '[ "alice", "100.0000 DRAGON", "memo" ]' -p eosdragontkn@active
cleos push action eosdragontkn issue '[ "bob", "100.0000 DRAGON", "memo" ]' -p eosdragontkn@active
#cd /home/devcomp34/blockhain_scripts/my_blockchain/permissions
#cleos set account permission bob active bob_permission.json owner -p bob       #allows dragonstake use eosio.code permission on behalf of bob
#cleos set account permission alice active alice_permission.json owner -p alice      /for some reason this doesn't allow us to use active permission? //we need to change publick key in JSON
cd /home/devcomp34/blockhain_scripts/my_blockchain/
cleos set account permission dragonstake active --add-code     #allows dragonstake to use eosio.code permission