#!/bin/bash

echo ALICE\'\ BALANCE
cleos get currency balance eosdragontkn alice
echo ALICE\'\ STAKES
cleos get table dragonstake alice stakes
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakesstats
cleos push action dragonstake stake '["alice","alice","1.0000 DRAGON"]' -p alice
echo ALICE\'\ BALANCE
cleos get currency balance eosdragontkn alice
echo ALICE\'\ STAKES
cleos get table dragonstake alice stakes
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakesstats