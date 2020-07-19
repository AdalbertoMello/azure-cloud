sudo apt-get -y update       
sudo apt -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev
sudo sysctl -w vm.nr_hugepages=1500
