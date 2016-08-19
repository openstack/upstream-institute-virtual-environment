#!/usr/bin/env bash
# TODO: select local server for updates
APT_MIRROR=http://mirror.switch.ch/ftp/mirror


export DEBIAN_FRONTEND=noninteractive
sudo sed -i "s@http://archive.ubuntu.com@$APT_MIRROR@g" /etc/apt/sources.list
sudo apt-get update
sudo apt-get dist-upgrade -y

# Fixing headless dictionaries-common install
sudo apt-get install -y dictionaries-common
sudo /usr/share/debconf/fix_db.pl
sudo dpkg-reconfigure dictionaries-common
sudo apt-get dist-upgrade -y

# Set up a desktop environment
sudo apt-get install -y xfce4
sudo apt-get install -y lightdm lightdm-gtk-greeter \
    --no-install-recommends --no-install-suggests
# Install basic GUI applications
sudo apt-get install -y firefox xfce4-terminal xfce4-whiskermenu-plugin \
    vim-gtk geany xchat
# Install basic TUI applications
sudo apt-get install -y htop mc tmux
# Install git workflow related software
sudo apt-get install -y git gitk git-gui git-review tig

sudo apt-get clean

# Enable shared folder access
sudo adduser vagrant vboxsf

# Enable autologin
sudo cp -ar /vagrant/files/etc /
