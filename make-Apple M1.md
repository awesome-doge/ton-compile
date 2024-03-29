# Apple M1 compile

```bash
# generate env folder / clone ton source code
mkdir ~/ton-env
cd ~/ton-env
git clone --recursive https://github.com/ton-blockchain/ton.git

cd ~/ton-env/ton/third-party/abseil-cpp/
git checkout 20211102.0


# Install dependent packages
brew update
brew install openssl cmake llvm
brew link openssl --force

# compile
cd ~/ton-env/
mkdir ton-bin
cd ~/ton-env/ton-bin

cmake ~/ton-env/ton -DCMAKE_BUILD_TYPE=Release -DTON_ARCH= -Wno-dev -DCMAKE_CXX_FLAGS="-std=c++17"

cpunumber=$(sysctl -n hw.logicalcpu)
make -j $cpunumber

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

# TON environment variable
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