rm -rf $HOME/.local/share/eosio/nodeos || true
URL="http://storage.googleapis.com/eos-kylin-snapshot/snapshot-2019-06-10-09(utc)-0312d3b9843e2efa6831806962d6c219d37200e0b897a0d9243bcab40b2b546b.bin"
P2P_FILE=https://raw.githubusercontent.com/cryptokylin/CryptoKylin-Testnet/master/fullnode/config/config.ini
GENESIS=https://raw.githubusercontent.com/cryptokylin/CryptoKylin-Testnet/master/genesis.json
CHAIN_STATE_SIZE=256000
wget $URL -O $HOME/.local/share/eosio/nodeos/data/snapshots/boot.bin
cd $HOME/.local/share/eosio/nodeos/config
wget $GENESIS
cat <<EOF >> $HOME/.local/share/eosio/nodeos/config/config.ini
agent-name = "DSP"
p2p-server-address = addr:8888
http-server-address = 0.0.0.0:8888
p2p-listen-endpoint = 0.0.0.0:9876
blocks-dir = "blocks"
abi-serializer-max-time-ms = 3000
max-transaction-time = 150000
wasm-runtime = wabt
reversible-blocks-db-size-mb = 1024
contracts-console = true
p2p-max-nodes-per-host = 1
allowed-connection = any
max-clients = 100
network-version-match = 1 
sync-fetch-span = 500
connection-cleanup-period = 30
http-validate-host = false
access-control-allow-origin = *
access-control-allow-headers = *
access-control-allow-credentials = false
verbose-http-errors = true
http-threads=8
net-threads=8
read-mode = head
trace-history-debug-mode = true
trace-history = true
plugin = eosio::producer_plugin
plugin = eosio::chain_plugin
plugin = eosio::chain_api_plugin
plugin = eosio::net_plugin
plugin = eosio::state_history_plugin
state-history-endpoint = 0.0.0.0:8887
chain-state-db-size-mb = $CHAIN_STATE_SIZE
EOF
curl $P2P_FILE > p2p-config.ini
cat p2p-config.ini | grep "p2p-peer-address" >> $HOME/.local/share/eosio/nodeos/config/config.ini
nodeos --disable-replay-opts --snapshot $HOME/.local/share/eosio/nodeos/data/snapshots/boot.bin --delete-all-blocks

mkdir /opt/Jungle2Testnet
cd /opt/Jungle2Testnet
git clone https://github.com/EOS-Jungle-Testnet/Node-Manual-Installation.git ./
cd /opt/Jungle2Testnet/snapshots/
wget http://backup.jungletestnet.io/snapshots/latest-snapshot.bin
cd /opt/Jungle2Testnet
./start.sh --snapshot /opt/Jungle2Testnet/snapshots/latest-snapshot.bin
