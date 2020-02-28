#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

LOG=${DIR}/compilation.log
#erase file contents
> $LOG

echo "compiling system contracts"
for D in $DIR/../system_contracts/*/; do 
    cd ${D}
    ./scripts/compile.sh &>> ${LOG} 
done

echo "compiling dragonoption contracts"
for D in $DIR/../contracts/*/; do 
    cd ${D}
    ./scripts/compile.sh $(git for-each-ref --format='%(refname:short)' --sort=-committerdate refs/remotes/origin/ | head -n 1) &>> ${LOG}
done