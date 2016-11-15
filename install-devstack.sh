#!/usr/bin/env bash

REPO=$(dirname "$(readlink -f "$0")")/

# Install devstack
sudo mkdir /opt/devstack
sudo chown -R "$USER:$GROUP" /opt/devstack

git clone https://git.openstack.org/openstack-dev/devstack /opt/devstack
cp -ar "$REPO/files/opt" /

/opt/devstack/stack.sh

sudo apt clean

# Enable OFFLINE mode for next invoking stack.sh to be faster
sed -i 's/#OFFLINE=/OFFLINE=/' /opt/devstack/local.conf
