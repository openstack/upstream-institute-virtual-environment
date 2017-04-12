#!/usr/bin/env bash

# Empty packages cache
sudo apt clean

# Remove compiled pyc files
sudo updatedb
for pyc in $(locate *.pyc); do
    sudo rm -rf $pyc
done

# Empty user caches
rm -rf ~/.cache/*
