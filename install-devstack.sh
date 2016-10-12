#!/usr/bin/env bash

REPO=$(dirname "$(readlink -f "$0")")/

# Install devstack
sudo mkdir /opt/devstack
sudo chown -R "$USER:$GROUP" /opt/devstack

git clone https://git.openstack.org/openstack-dev/devstack /opt/devstack
cp -ar "$REPO/files/opt" /

# sudo chown -R "$USER:$GROUP" /opt/devstack
# sudo chown -R "$USER:$GROUP" /opt/stack

/opt/devstack/stack.sh

sudo apt-get clean
