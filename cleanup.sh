#!/usr/bin/env bash

# Remove older kernels
OLDS=$(dpkg -l | awk '/linux-image-[0-9]/{ print $2 }' \
               | sort -r \
               | sed 's/linux-image-\(.*\)-generic/\1/g' \
               | tail -n +2)
for old in $OLDS; do
    sudo apt autoremove --purge  -y ".*$old.*"
done

# Empty user caches
rm -rf ~/.cache
sudo rm -rf /root/.cache

# Remove compiled pyc files
sudo updatedb
for pyc in $(locate -- *.pyc); do
    sudo rm -rf "$pyc"
done
sudo updatedb

# Remove unused packages
sudo apt autoremove --purge -y humanity-icon-theme snapd

# Empty packages cache
sudo apt clean

# Zero out unused space
dd if=/dev/zero of=~/ZERO bs=1M status=progress
rm -rf ~/ZERO
