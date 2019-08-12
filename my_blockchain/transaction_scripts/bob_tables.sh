#!/bin/bash

echo BOB\'\ BALANCE
cleos get currency balance eosdragontkn bob
echo BOB\'\ STAKES
cleos get table dragonstake bob accountstake
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakestats
echo BOB\'\ LOG
cleos get table dragonstake bob unstakelog
