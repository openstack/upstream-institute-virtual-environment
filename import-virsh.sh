#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
  echo "Usage: ./import-virsh.sh upstream-training.ova"
  exit 1
fi

(command -v qemu-img     &>/dev/null  &&
 command -v virt-manager &>/dev/null  &&
 command -v virsh        &>/dev/null) || {
  echo >&2 'Required tools cannot be found. Install using one of the following methods:'
  echo >&2
  echo >&2 'On Debian-based systems: apt install qemu-utils libvirt-clients virt-manager'
  echo >&2 'On RedHat-based systems: yum install qemu-img libvirt virt-install virt-manager'
  exit 1
}

echo "Aquiring image..."
tar xf "$1"
echo "Converting image to QCOW2"
qemu-img convert -f vmdk -O qcow2 upstream-training-disk001.{vmdk,qcow2}
echo "Uploading image to pool 'default' as 'upstream-training'"
virsh vol-create-as default upstream-training 40GiB

VOL=$(virsh vol-path upstream-training --pool default)

virt-install --name upstream-training --import --disk "$VOL" \
     --vcpus 2 --memory 4096 \
     --network default \
     --video model=qxl,ram=65536,vram=65536,vgamem=16384,heads=1 --channel spicevmc \
     --noautoconsole

echo "Creating virutal machine"
virsh define "$XML"

echo "Remove unneeded files"
rm upstream-training-disk001.{vmdk,qcow2}

echo "Creating successful. Start Virtual Machine Manager (virt-manager) to see your newly created VM."

# vim: set fen fdm=marker fmr={{{,}}} fdc=2:
