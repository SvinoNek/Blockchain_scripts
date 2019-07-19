echo BOB\'\ BALANCE
cleos get currency balance eosdragontkn bob
echo ALICE\'\ BALANCE
cleos get currency balance eosdragontkn alice
echo DRAGONSTAKE\'S\ BALANCE
cleos get currency balance eosdragontkn dragonstake
echo BOB\'\ STAKES
cleos get table dragonstake bob stakes
echo ALICE\'\ STAKES
cleos get table dragonstake alice stakes
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakesstats
cleos push action dragonstake stake '["alice","bob","1.0000 DRAGON"]' -p alice
echo BOB\'\ BALANCE
cleos get currency balance eosdragontkn bob
echo ALICE\'\ BALANCE
cleos get currency balance eosdragontkn alice
echo DRAGONSTAKE\'S\ BALANCE
cleos get currency balance eosdragontkn dragonstake
echo BOB\'\ STAKES
cleos get table dragonstake bob stakes
echo ALICE\'\ STAKES
cleos get table dragonstake alice stakes
echo STAKES_TOTAL
cleos get table dragonstake dragonstake stakesstats