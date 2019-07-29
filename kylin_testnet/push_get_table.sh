#!bin/bash


cat ~/blockhain_scripts/kylin_testnet/vramtkntest1_pass.txt|cleos wallet unlock -n $KYLIN_TEST_ACCOUNT 
export DSP_ENDPOINT=https://kylin-dsp-1.liquidapps.io
export KYLIN_TEST_ACCOUNT=vramtkntest1
export KYLIN_TEST_PUBLIC_KEY=EOS8em1PDfkrmZH6CfPtqgwBuo8KxyXd7k2jZTjZKMAcV7UDzBqyu
export PROVIDER=uuddlrlrbass
export PACKAGE_ID=package1
export SERVICE=ipfsservice1
cleos -u $DSP_ENDPOINT push action $KYLIN_TEST_ACCOUNT useram '["test"]' -p $KYLIN_TEST_ACCOUNT@active
curl https://kylin-dsp-1.liquidapps.io/v1/dsp/ipfsservice1/get_table_row -d '{"contract":"vramtkntest1","scope":"test","table":"ram","key":"test"}' | python -m json.tool
