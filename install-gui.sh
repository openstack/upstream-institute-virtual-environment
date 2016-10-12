#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Set up a desktop environment
sudo apt-get install -y xfce4
sudo apt-get install -y lightdm lightdm-gtk-greeter \
    --no-install-recommends --no-install-suggests
# Install basic GUI applications
sudo apt-get install -y firefox xfce4-terminal xfce4-whiskermenu-plugin \
    vim-gtk geany xchat

sudo apt-get clean
