#!bin/bash/

cd /home/devcomp34/blockhain_scripts/kylin_testnet/
rm /home/devcomp34/eosio-wallet/ -r
cleos wallet create -n glebbeloded1 --file ./glebbeloded1_pass.txt
cleos wallet import -n glebbeloded1 --private-key 5JQG8hawAAjhDwgp3jRgVk1LXWmSbEqZuTVXLcpDWuRBQBipDnh
cleos wallet create -n vramtkntest1 --file ./vramtkntest1_pass.txt
cleos wallet import -n vramtkntest1 --private-key 5KMTtDAbEtGzxJc5C6Lm7T7Sfqe7ygWzNyi3TxuQWGLsXKD7Emb
cleos wallet create -n glebtknlocal --file ./glebbeloded1_pass.txt
cleos wallet import -n glebtknlocal --private-key 5HrD4McLY9sTYJraFWG2UCWXAcT9QSzqn152Y55mY7q3wv9YToV