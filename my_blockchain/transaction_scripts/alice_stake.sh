#!/bin/bash

echo alice\'\ BALANCE
cleos get currency balance eosdragontkn alice
echo alice\'\ STAKES
cleos get table dragonstake alice accountstake
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakestats
cleos push action dragonstake stake '["alice","1.0000 DRAGON"]' -p alice@active
echo alice\'\ BALANCE
cleos get currency balance eosdragontkn alice
echo alice\'\ STAKES
cleos get table dragonstake alice accountstake
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakestats