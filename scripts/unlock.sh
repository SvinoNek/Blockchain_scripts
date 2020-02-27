#!/bin/bash
# this script reads password from wallet.info file and unlocks it
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PASS=$(cat $DIR/wallet.info|jq -r .wallet_pass)
yes "$PASS" | cleos wallet unlock