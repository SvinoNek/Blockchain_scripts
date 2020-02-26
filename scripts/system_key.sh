#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
KEY=$(cat $DIR/wallet.info|jq -r .pubkey)
echo $KEY