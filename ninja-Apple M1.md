# Apple M1 compile

```bash
# Install dependent packages
brew update
brew install openssl cmake llvm
brew link openssl --force

# Install ninja
brew install ninja

# generate env folder / clone ton source code
mkdir ~/ton-env
cd ~/ton-env
git clone --recursive https://github.com/ton-blockchain/ton.git

# compile
cd ~/ton-env/
mkdir ton-bin
cd ~/ton-env/ton-bin

cmake ~/ton-env/ton \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja \
    -Wno-dev

cpunumber=$(sysctl -n hw.logicalcpu)
ninja -j $cpunumber

# Remove the global.config file
rm -r ~/ton-env/global-config.json
#rm -r ~/ton-env/testnet-global.config.json
rm -r ~/ton-env/global-config-wallet.json
rm -r ~/ton-env/global-config-archive.json
rm -r ~/ton-env/global.config.json
rm -r ~/ton-env/testnet-global.config.json

# Download the global.config file
wget https://ton.org/global-config.json -P ~/ton-env/
#wget https://ton.org/testnet-global.config.json -P ~/ton-env/

wget https://ton.org/global-config-wallet.json -P ~/ton-env/
wget https://ton.org/global-config-archive.json -P ~/ton-env/

wget https://ton-blockchain.github.io/global.config.json -P ~/ton-env/
wget https://ton-blockchain.github.io/testnet-global.config.json -P ~/ton-env/

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
