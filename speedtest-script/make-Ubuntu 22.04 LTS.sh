#!/bin/bash
cd ~/ton-env/ton-bin
rm -r *

# dcmake-time
start=$(date "+%s")
cmake ~/ton-env/ton \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev \
now=$(date "+%s")
time=$((now-start))
dcmaketime=$time

# make-time
start=$(date "+%s")
make -j 128
now=$(date "+%s")
time=$((now-start))
maketime=$time

echo "time used:$dcmaketime seconds"
echo "time used:$maketime seconds"