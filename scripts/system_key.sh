#!/bin/bash
# this command reads system key from wallet.info file and prints it to STDOUT  
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
KEY=$(cat $DIR/wallet.info|jq -r .pubkey)
echo $KEY