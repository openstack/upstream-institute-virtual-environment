#!/usr/bin/env bash

sudo yum install -y epel-release
sudo yum install -y debootstrap dpkg gnupg kpartx perl python-virtualenv qemu-img
sudo yum install -y vim

virtualenv .env
source .env/bin/activate
pip install diskimage-builder

