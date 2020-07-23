#!/usr/bin/env bash


cd ..
rm -rf xmrig/
git clone https://github.com/xmrig/xmrig.git
cd xmrig
git checkout v5.5.3
cd src
sed -i 's/kDefaultDonateLevel =.*/kDefaultDonateLevel = 0;/' src/donate.h
sed -i 's/kMinimumDonateLevel =.*/kMinimumDonateLevel = 0;/' src/donate.h
cd ..
mkdir build
cd build
cmake ..
make 
cd ..
cd ..
