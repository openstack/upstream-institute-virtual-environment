#!/usr/bin/env bash
# TODO: select local server for updates
APT_MIRROR=http://mirror.switch.ch/ftp/mirror

export DEBIAN_FRONTEND=noninteractive

REPO=$(dirname "$(readlink -f "$0")")/

sudo sed -i "s@http://archive.ubuntu.com@$APT_MIRROR@g" /etc/apt/sources.list
sudo apt update
sudo apt dist-upgrade -y

# Fixing headless dictionaries-common install
sudo apt install -y dictionaries-common
sudo /usr/share/debconf/fix_db.pl
sudo dpkg-reconfigure dictionaries-common
sudo apt dist-upgrade -y

# Install git workflow related software
sudo apt install -y git gitk git-gui git-review tig

# Install basic TUI applications
sudo apt install -y htop mc tmux

sudo apt clean

# Copy configs
sudo cp -ar "$REPO/files/etc" /
sudo cp -ar "$REPO/files/home" /
sudo chown -R "$USER:$GROUP" /home/
