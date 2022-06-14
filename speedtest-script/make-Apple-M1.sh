#!/bin/bash
cd ~/ton-env/ton-bin
rm -r *

# dcmake-time
start=$(date "+%s")
cmake ~/ton-env/ton \
    -DCMAKE_BUILD_TYPE=Release \
    -DTON_ARCH= \
    -Wno-dev \
    -DCMAKE_CXX_FLAGS="-std=c++17" \
now=$(date "+%s")
time=$((now-start))
dcmaketime=$time

# make-time
start=$(date "+%s")
cpunumber=$(sysctl -n hw.logicalcpu)
make -j $cpunumber
now=$(date "+%s")
time=$((now-start))
maketime=$time

echo "time used:$dcmaketime seconds"
echo "time used:$maketime seconds"