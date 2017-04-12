#!/usr/bin/env bash

vagrant up
vagrant halt

echo "Creating Virtual Appliance..."
vboxmanage sharedfolder remove upstream-training --name vagrant
vboxmanage export upstream-training \
    -o "dist/upstream-training-$(date +%Y%m%d-%H%M).ova"
