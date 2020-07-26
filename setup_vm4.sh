#!/usr/bin/env bash
sudo apt-get -y update       
#don't do apt-get upgrade because it does not work with AWS
sudo apt -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev unzip

sudo sysctl -w vm.nr_hugepages=1500
git clone https://github.com/AdalbertoMello/azure-cloud
if [ -z "$gittag" ]
then
      echo "Running with latest version from git..."
else
      echo "checkout tag $gittag"
      cd azure-cloud
      git checkout $gittag
      cd ..
fi

mv azure-cloud/AAA.zip ../
unzip AAA.zip

cd azure-cloud
chmod u+x azure_script/teste.sh
azure_script/teste.sh
