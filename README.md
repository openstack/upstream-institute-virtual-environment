OpenStack upstream training virtual environment
===============================================

Introduction
------------

### What's this?

A Virtual Machine that has installed in it software what you need to start
hacking OpenStack. If you're coming to the [Upstream
Training](http://docs.openstack.org/upstream-training/) two days before
[OpenStack Summit](https://www.openstack.org/summit/) starts, you are at the
right place.

### What do I need?

* 6GB of _free_ RAM (so at least 8GB in your laptop)
* [VirtualBox](https://www.virtualbox.org/)
* Recent CPU with at least 4 cores

### What do I want?

| A prebuilt image                        | I want to build myself             |
| ----------------                        | ----------------------             |
| Takes 15 minutes                        | Takes 45-60 minutes                |
| [Instructions][#using-a-prebuilt-image] | [Instructions][#building-your-own] |
| [Download image][image]                 |                                    |

[image]: https://s3.eu-central-1.amazonaws.com/openstack-training/devstack-vm.ova

Instructions
------------

### Using a prebuilt image

1. Set up VirtualBox
2. Download the [pre-built image][image]
3. Import the `ova` file (`File` -> `Import appliance...`)
4. Start up the VM
5. Open a terminal and start devstack

        cd /opt/devstack
        ./stack.sh

    This step takes about 10-15 minutes, it needs an internet connection,
    however the expected downloaded data stays low if using  a fresh enough
    appliance.


### Building your own

1. Set up VirtualBox
2. Set up Vagrant
3. `git clone https://github.com/kmARC/openstack-training-virtual-environment`
4. `cd openstack-training-virtual-environment`
5. `vagrant up`
6. `vagrant reload`
7. Follow [instructions for the prebuilt image](#using-a-prebuilt-image) from
   step 4

### Roll your own image

Essentially the same procedure, with exporting an ova archive at the end which
then can be distributed and easily import into VirtualBox

`./create-training-box.sh` is a handy tool that sets up everythong with vagrant
and then creates the distributable box file.

### Learn how to easily set up devstack

* [install-base.sh](install-base.sh) and 
  [install-devstack.sh](install-devstack.sh) - commands used during provisioning
* [files/](files/) - configuration files copied into the vm

Screenshots
-----------

Devstack running
![Devstack running](docs/01.png "Devstack running")

Geany with keystone code loaded
![Geany with keystone code loaded](docs/02.png "Geany with keystone code loaded")

git and XChat
![git and XChat](docs/03.png "git and XChat")

License
-------
MIT

