#!/usr/bin/env bash

sudo yum install -y debootstrap dpkg gnupg kpartx perl python-virtualenv qemu-img

virtualenv .env
source .env/bin/activate
pip install diskimage-builder

