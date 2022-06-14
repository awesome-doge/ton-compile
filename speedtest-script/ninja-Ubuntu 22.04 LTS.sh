#!/bin/bash
cd ~/ton-env/ton-bin
rm -r *

# ninja-dcmake-time
start=$(date "+%s")
cmake ~/ton-env/ton \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev \
    -DCMAKE_CXX_FLAGS="-std=c++17" \
    -GNinja
now=$(date "+%s")
time=$((now-start))
ninjadcmaketime=$time

# ninja-time
start=$(date "+%s")
ninja -j 128
now=$(date "+%s")
time=$((now-start))
ninjatime=$time

echo "time used:$ninjadcmaketime seconds"
echo "time used:$ninjatime seconds"