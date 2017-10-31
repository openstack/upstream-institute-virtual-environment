#!/usr/bin/env bash

set -e

VDISKMANAGER_DOWNLOAD='https://kb.vmware.com/selfservice/viewAttachment.do?attachID=1023856-vdiskmanager-linux.7.0.1.zip&documentID=1023856'

vagrant up
vagrant halt

if [[ ! -e dist/vmware-vdiskmanager ]]; then
    wget "$VDISKMANAGER_DOWNLOAD" -O /tmp/vmware-vdiskmanager.zip
    unzip /tmp/vmware-vdiskmanager.zip -d dist/
    mv dist/*vmware-vdiskmanager* dist/vmware-vdiskmanager
fi

VMDK=$(vboxmanage showvminfo upstream-training --machinereadable \
                  | grep SCSI-0-0 \
                  | cut -d'"' -f4)

echo "Shrinking image..."
./dist/vmware-vdiskmanager -d "$VMDK"
./dist/vmware-vdiskmanager -k "$VMDK"

echo "Creating Virtual Appliance..."
vboxmanage sharedfolder remove upstream-training --name vagrant
vboxmanage export upstream-training \
    -o "dist/upstream-training-$(date +%Y%m%d-%H%M).ova"
