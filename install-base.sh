#!/usr/bin/env bash
# TODO: select local server for updates
APT_MIRROR=http://mirror.switch.ch/ftp/mirror

export DEBIAN_FRONTEND=noninteractive

REPO=$(dirname "$(readlink -f "$0")")/

# Copy configs
sudo cp -ar "$REPO/files/etc" /
sudo cp -ar "$REPO/files/home" /
sudo chown -R "$USER:$GROUP" /home/

# Copy scripts
sudo cp -ar "$REPO/files/usr" /

sudo sed -i "s@http://archive.ubuntu.com@$APT_MIRROR@g" /etc/apt/sources.list
sudo apt update
sudo apt dist-upgrade -y

# Install git workflow related software
sudo apt install -y git gitk git-gui git-review tig

# Install basic TUI applications
sudo apt install -y htop mc tmux

# Set password
echo "$USER:openstack" | sudo chpasswd

# Disable Console serial port redirection
sudo sed -i "s/console=ttyS0//g" /etc/default/grub
sudo sed -i "s/console=ttyS0//g" /etc/default/grub.d/*
sudo update-grub
