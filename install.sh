#!/usr/bin/env bash
sudo apt-get update
# Set up a desktop environment
sudo apt-get install -y xfce4
sudo apt-get install -y lightdm lightdm-gtk-greeter \
    --no-install-recommends --no-install-suggests
# Install basic GUI applications
sudo apt-get install -y firefox xfce4-terminal vim-gtk geany xchat
# Install basic TUI applications
sudo apt-get install -y htop mc tmux
# Install git workflow related software
sudo apt-get install -y git gitk git-gui git-review tig

sudo apt-get clean

# Install devstack
DIR_DEVSTACK=/opt/devstack
sudo git clone https://git.openstack.org/openstack-dev/devstack $DIR_DEVSTACK
sudo cp -ar /vagrant/files/opt /
sudo chown -R vagrant:vagrant $DIR_DEVSTACK
sudo chown -R vagrant:vagrant /opt/stack
$DIR_DEVSTACK/stack.sh

# Enable autologin
sudo cp -ar /vagrant/files/etc /
