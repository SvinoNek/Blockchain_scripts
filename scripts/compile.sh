#!/bin/bash
set -e
args=("$@")
#get first command line argument
if [ $# != 1 ]; then
    echo "you have to pass valid git branch in order to compile the contract";exit 1;
fi
# checkout branch passed as the argument
git fetch
git checkout ${args[0]}
