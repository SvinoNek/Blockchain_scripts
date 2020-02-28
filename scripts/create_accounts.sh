#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PUBKEY=$(${DIR}/system_key.sh)
${DIR}/unlock.sh


cleos create account eosio eosio.token $PUBKEY


cleos create account eosio dragonaccnts $PUBKEY
cleos create account eosio dragonexchng $PUBKEY
cleos create account eosio dragonoption $PUBKEY
cleos create account eosio dragonreward $PUBKEY
cleos create account eosio dragonstakes $PUBKEY
cleos create account eosio eosdragontkn $PUBKEY


cleos create account eosio bob $PUBKEY
cleos create account eosio alice $PUBKEY
