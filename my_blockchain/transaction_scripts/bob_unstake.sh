#!/bin/bash

echo BOB\'\ BALANCE
cleos get currency balance eosdragontkn bob
echo BOB\'\ STAKES
cleos get table dragonstake bob stakes
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakesstats
cleos push action dragonstake unstake '["bob","bob","1.0000 DRAGON"]' -p bob
echo BOB\'\ BALANCE
cleos get currency balance eosdragontkn bob
echo BOB\'\ STAKES
cleos get table dragonstake bob stakes
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakesstats
