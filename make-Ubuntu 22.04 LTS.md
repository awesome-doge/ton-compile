# Ubuntu 22.04 LTS compile

```bash
# Install dependent packages
apt-get update
apt-get install git build-essential git make cmake clang libgflags-dev zlib1g-dev libssl-dev libreadline-dev libmicrohttpd-dev pkg-config libgsl-dev python3 python3-dev python3-pip -y

# generate env folder / clone ton source code
mkdir ~/ton-env
cd ~/ton-env
git clone --recursive https://github.com/ton-blockchain/ton.git

cd ~/ton-env/ton/third-party/abseil-cpp/
git checkout 20211102.0

# compile
cd ~/ton-env/
mkdir ton-bin
cd ~/ton-env/ton-bin
export CC=$(which clang)
export CXX=$(which clang++)
export CCACHE_DISABLE=1
cmake ~/ton-env/ton -DCMAKE_BUILD_TYPE=Release -Wno-dev

make -j 128

# Remove the global.config file
rm -r ~/global-config.json
#rm -r ~/testnet-global.config.json
rm -r ~/global-config-wallet.json
rm -r ~/global-config-archive.json
rm -r ~/global.config.json
rm -r ~/testnet-global.config.json

# Download the global.config file
wget https://ton.org/global-config.json -P ~/
#wget https://ton.org/testnet-global.config.json -P ~/

wget https://ton.org/global-config-wallet.json -P ~/
wget https://ton.org/global-config-archive.json -P ~/

wget https://ton-blockchain.github.io/global.config.json -P ~/
wget https://ton-blockchain.github.io/testnet-global.config.json -P ~/

# Add smart contract path
export FIFTPATH=~/ton-env/ton/crypto/fift/lib
export FIFTPATH=$FIFTPATH:~/ton-env/ton/crypto/smartcont/

# ton environment variable
export PATH=$PATH:~/ton-env/ton-bin/adnl
export PATH=$PATH:~/ton-env/ton-bin/blockchain-explorer
export PATH=$PATH:~/ton-env/ton-bin/create-hardfork
export PATH=$PATH:~/ton-env/ton-bin/crypto
export PATH=$PATH:~/ton-env/ton-bin/dht-server
export PATH=$PATH:~/ton-env/ton-bin/http
export PATH=$PATH:~/ton-env/ton-bin/lite-client
export PATH=$PATH:~/ton-env/ton-bin/rldp-http-proxy
export PATH=$PATH:~/ton-env/ton-bin/storage
export PATH=$PATH:~/ton-env/ton-bin/tddb
export PATH=$PATH:~/ton-env/ton-bin/tdfec/benchmark
export PATH=$PATH:~/ton-env/ton-bin/tdnet
export PATH=$PATH:~/ton-env/ton-bin/tl/generate
export PATH=$PATH:~/ton-env/ton-bin/tonlib
export PATH=$PATH:~/ton-env/ton-bin/utils
export PATH=$PATH:~/ton-env/ton-bin/validator-engine
export PATH=$PATH:~/ton-env/ton-bin/validator-engine-console
```