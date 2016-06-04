#!/usr/bin/env bash

vagrant up
vagrant halt

echo "Creating Virtual Appliance..."
vboxmanage export devstack-training \
    -o "dist/devstack-training-$(date +%Y%m%d-%H%M).ova"
