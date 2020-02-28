#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

LOG=${DIR}/deployment.log
#erase file contents
> $LOG
${DIR}/unlock.sh

echo "deploying system contracts"
for D in $DIR/../system_contracts/*/; do 
    cd ${D}
    ./scripts/deploy_localnet.sh &>> ${LOG} 
done

echo "deploying dragonoption contracts"
for D in $DIR/../contracts/*/; do 
    cd ${D}
    ./scripts/deploy_localnet.sh $(git for-each-ref --format='%(refname:short)' --sort=-committerdate refs/remotes/origin/ | head -n 1) &>> ${LOG}
done