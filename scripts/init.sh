#!/bin/bash
#this script creates eos node and writes useful data to wallet.info 
set -e 
#remove existing wallet
pkill keosd
rm -rf ~/eosio-wallet
#remove previous blockchain state and data
pkill nodeos
rm -rf ~/.local/share/eosio/nodeos
#create wallet
PASS=$(cleos wallet create --to-console | grep "\".*\"" | tr -d '"')
echo pass = $PASS
#unlock it
cleos wallet open
yes "$PASS" | cleos wallet unlock
echo hello!
#create key
PUBKEY=$(cleos wallet create_key | grep -o "EOS\w*")
echo pubkey = $PUBKEY
#development key
SYSTEMKEY=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
yes "$SYSTEMKEY" | cleos wallet import
#start key server locally
#launch blockchain node
nodeos -e -p eosio \
--plugin eosio::producer_plugin \
--plugin eosio::producer_api_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::http_plugin \
--plugin eosio::history_plugin \
--plugin eosio::history_api_plugin \
--filter-on="*" \
--access-control-allow-origin='*' \
--contracts-console \
--http-validate-host=false \
--verbose-http-errors >> nodeos.log 2>&1 &

# wait for nodeos
until curl http://127.0.0.1:8888/v1/chain/get_info
do
  sleep 1s
done

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#create wallet.info json file
echo { > $DIR/wallet.info
echo \"wallet_pass\":\"$PASS\", >> $DIR/wallet.info
echo \"pubkey\":\"$PUBKEY\" >> $DIR/wallet.info
echo } >> $DIR/wallet.info