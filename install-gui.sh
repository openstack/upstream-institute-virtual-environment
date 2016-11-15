#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Set up a desktop environment
sudo apt install -y linux-image-extra-virtual
sudo apt install -y xfce4
sudo apt install -y lightdm lightdm-gtk-greeter \
    --no-install-recommends --no-install-suggests
# Install basic GUI applications
sudo apt install -y firefox xfce4-terminal xfce4-whiskermenu-plugin \
    vim-gtk geany hexchat

sudo apt clean
