#!/usr/bin/env bash

set -e

VMDK=upstream-training-disk001.vmdk
export ELEMENTS_PATH=./elements/

mkdir -p tmp

disk-image-create \
    -o "tmp/$VMDK" \
    -t vmdk \
    --qemu-img-options subformat=streamOptimized \
    --image-size 40 \
    upstream-training

DIST="dist/upstream-training-$(date +%Y%m%d-%H%M).ova"

cp upstream-training.ovf tmp/

pushd tmp/
tar -cf "../$DIST" upstream-training.ovf "$VMDK"
popd
