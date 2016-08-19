OpenStack upstream training virtual environment
===============================================

This repository contains a Vagrant-based devstack setup. It installs the
necessary components in an Ubuntu machine along with basic GUI features to be
able to start hacking on OpenStack.

Usage
-----

There is a prebuilt appliance, ready to use. [Download it from here](
https://s3.eu-central-1.amazonaws.com/openstack-training/devstack-vm.ova).

1. Set up VirtualBox
2. Import the `ova` file (`File` -> `Import appliance...`)
3. Start up the VM
4. Open a terminal and start devstack

        cd /opt/devstack
        ./stack.sh

    This step takes about 10-15 minutes, it needs an internet connection,
    however the expected downloaded data stays low if using  a fresh enough
    appliance.


Screenshots
-----------

Devstack running
![Devstack running](docs/01.png "Devstack running")

Geany with keystone code loaded
![Geany with keystone code loaded](docs/02.png "Geany with keystone code loaded")

git and XChat
![git and XChat](docs/03.png "git and XChat")


Building the Virtual Machine
----------------------------

You can either use vagrant to set up the environment, roll your own VirtualBox
image or just follow the installation script to manually set up devstack.

### Using Vagrant

This method actually sets up everything including devstack. It takes a fair
amount of time (more than 30 minutes based on the internet connection)

1. Set up VirtualBox
2. Set up Vagrant
3. `git clone https://github.com/kmARC/openstack-training-virtual-environment`
4. `cd openstack-training-virtual-environment`
5. `vagrant up`
6. `vagrant reload`

### Roll your own image

Essentially the same procedure, with exporting an ova archive at the end which
then can be distributed and easily import into VirtualBox

`./create-training-box.sh` is a handy tool that sets up everythong with vagrant
and then creates the distributable box file.

### Learn how to easily set up devstack

* [install-base.sh](install-base.sh) and 
  [install-devstack.sh](install-devstack.sh) - commands used during provisioning
* [files/](files/) - configuration files copied into the vm

License
-------
MIT



