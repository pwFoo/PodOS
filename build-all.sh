#!/bin/sh

# build all packages with kernel and modules
./packages.sh 


# build OS kernel+initrd
./linuxkit.sh -yml rustysd.yml -out $(pwd)/out  


# run (needs qemu)
./qemu.sh
