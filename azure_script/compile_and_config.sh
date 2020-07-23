#!/usr/bin/env bash


cd ..
rm -rf xmrig/
git clone https://github.com/xmrig/xmrig.git
cd xmrig
git checkout v5.5.3

sed -i 's/kDefaultDonateLevel =.*/kDefaultDonateLevel = 0;/' src/donate.h
sed -i 's/kMinimumDonateLevel =.*/kMinimumDonateLevel = 0;/' src/donate.h

sed -i 's/"url":.*/"url": null,/' src/config.json
sed -i 's/"donate-level":.*/"donate-level": 0,/' src/config.json
sed -i 's/"donate-over-proxy":.*/"donate-over-proxy": 0,/' src/config.json

sed -i 's/"url":.*/"url": null,/' src/core/config/Config_default.h
sed -i 's/"donate-level":.*/"donate-level": 0,/' src/core/config/Config_default.h
sed -i 's/"donate-over-proxy":.*/"donate-over-proxy": 0,/' src/core/config/Config_default.h

sed -i 's/kDonateHost =.*/kDonateHost = "example.com";/' src/net/strategies/DonateStrategy.cpp
sed -i 's/kDonateHostTls =.*/kDonateHostTls = "example.com";/' src/net/strategies/DonateStrategy.cpp

mkdir build
cd build
cmake ..
make 
cd ..
cd ..
