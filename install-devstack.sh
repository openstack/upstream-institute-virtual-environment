#!/usr/bin/env bash

# Install devstack
DIR_DEVSTACK=/opt/devstack
sudo git clone https://git.openstack.org/openstack-dev/devstack $DIR_DEVSTACK
sudo cp -ar /vagrant/files/opt /
sudo chown -R vagrant:vagrant $DIR_DEVSTACK
sudo chown -R vagrant:vagrant /opt/stack
$DIR_DEVSTACK/stack.sh

sudo apt-get clean
