#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Set up a desktop environment
sudo apt install -y xserver-xorg-input-evdev
sudo apt install -y adwaita-icon-theme-full gnome-themes-standard \
                    gtk2-engines-pixbuf thunar xfce4-panel xfce4-session \
                    xfdesktop4 xfwm4
sudo apt install -y lightdm lightdm-gtk-greeter
# Install basic GUI applications
sudo apt install -y firefox xfce4-terminal xfce4-whiskermenu-plugin \
                    vim-gtk geany hexchat
# Configure virtualbox GUI
sudo apt install -y virtualbox-guest-dkms virtualbox-guest-x11
# Configure vmware GUI
sudo apt install -y open-vm-tools-desktop open-vm-tools-dkms \
                    xserver-xorg-input-vmmouse xserver-xorg-video-vmware

