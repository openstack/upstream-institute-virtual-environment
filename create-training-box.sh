#!/usr/bin/env bash

set -e

# Create a VMDK image by default. Override with
# "create-training-box.sh <FORMAT>", where FORMAT can be any format
# that qemu-img understands.
FORMAT=${1:-vmdk}
DISK=upstream-training-disk001.$FORMAT

export ELEMENTS_PATH=./elements/

mkdir -p tmp

DIB_OPTIONS="-o tmp/$DISK -t $FORMAT --image-size 40"
if [ "$FORMAT" = "vmdk" ]; then
    DIB_OPTIONS="$DIB_OPTIONS --qemu-img-options subformat=streamOptimized"
fi

disk-image-create \
    $DIB_OPTIONS \
    upstream-training

# If we're configured to create a VMDK or VDI image, assume that we're
# building for VirtualBox and also create an OVA tarball
if [ "$FORMAT" = "vmdk" ] || [ "$FORMAT" = "vdi" ]; then
    DIST="dist/upstream-training-$(date +%Y%m%d-%H%M).ova"

    cp upstream-training.ovf tmp/

    pushd tmp/
    tar -cf "../$DIST" upstream-training.ovf "$DISK"
    popd
fi
