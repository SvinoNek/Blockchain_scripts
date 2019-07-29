#!bin/bash


export DSP_ENDPOINT=https://kylin-dsp-1.liquidapps.io
export KYLIN_TEST_ACCOUNT=vramtkntest1
export KYLIN_TEST_PUBLIC_KEY=EOS8em1PDfkrmZH6CfPtqgwBuo8KxyXd7k2jZTjZKMAcV7UDzBqyu
export PROVIDER=uuddlrlrbass
export PACKAGE_ID=package1
export SERVICE=ipfsservice1
cleos -u $DSP_ENDPOINT system buyram $KYLIN_TEST_ACCOUNT $KYLIN_TEST_ACCOUNT "50.0000 EOS" -p $KYLIN_TEST_ACCOUNT@active
cleos -u $DSP_ENDPOINT set contract $KYLIN_TEST_ACCOUNT /home/devcomp34/kylin_testnet/ramheavy1234/ -p $KYLIN_TEST_ACCOUNT@active
cat ~/blockhain_scripts/kylin_testnet/vramtkntest1_pass.txt|cleos wallet unlock -n $KYLIN_TEST_ACCOUNT 
cleos -u $DSP_ENDPOINT push action dappservices selectpkg "[\"$KYLIN_TEST_ACCOUNT\",\"$PROVIDER\",\"$SERVICE\",\"$PACKAGE_ID\"]" -p $KYLIN_TEST_ACCOUNT@active
cleos -u $DSP_ENDPOINT push action dappservices stake "[\"$KYLIN_TEST_ACCOUNT\",\"$PROVIDER\",\"$SERVICE\",\"50.0000 DAPP\"]" -p $KYLIN_TEST_ACCOUNT@active
