#!/bin/bash

echo BOB\'\ BALANCE
cleos get currency balance eosdragontkn bob
echo BOB\'\ STAKES
cleos get table dragonstake bob accountstake
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakestats
cleos push action dragonstake stake '["bob","1.0000 DRAGON"]' -p bob@active
echo BOB\'\ BALANCE
cleos get currency balance eosdragontkn bob
echo BOB\'\ STAKES
cleos get table dragonstake bob accountstake
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakestats