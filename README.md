OpenStack Training Virtual Environment
======================================

[bit.ly/training-vm](http://bit.ly/training-vm)
-----------------------------------------------

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
* Recent CPU with at least 4 cores
* 10GB disk space
* [VirtualBox](https://www.virtualbox.org/)

### What do I want?

| A prebuilt image                        | I want to build myself             |
| ----------------                        | ----------------------             |
| Takes 15 minutes                        | Takes 45-60 minutes                |
| [Instructions](#using-a-prebuilt-image) | [Instructions](#building-your-own) |
| [Download image][image] (2GB)           |                                    |

[image]: https://s3.eu-central-1.amazonaws.com/openstack-training/devstack-vm.ova
[ova-import-help]: README-virtualbox-import.md
Instructions
------------

### Using a prebuilt image

1. Set up VirtualBox
2. Download the [pre-built image][image]
3. Import the `ova` file (`File` -> `Import appliance...`) (More details to import on Windows are [here][ova-import-help].)
4. Set up a private network:
    - `File` -> `Preferences` -> `Network` -> `Host-only Networks`
    - Create a new host-only network with the following settings:
        * *IPv4 Address:* 192.168.50.1
        * *IPv4 Network Mask:* 255.255.255.0
        * *DHCP Server*: disabled
    - Select the virtual machine, `Settings` -> `Network` -> `Adapter 2`
    - Make sure that the adapter is enabled, attached to the host-only network
        you created.
5. Start up the VM
6. Open a terminal and start devstack

        cd /opt/devstack
        ./stack.sh

    This step takes about 10-15 minutes, it needs an internet connection,
    however the expected downloaded data stays low if using a fresh enough
    appliance.


### Building your own

1. Set up VirtualBox
2. Set up Vagrant
3. `git clone https://github.com/kmARC/openstack-training-virtual-environment`
4. `cd openstack-training-virtual-environment`
5. `vagrant up`
6. `vagrant reload`
7. `vagrant ssh`
8. Start devstack

        cd /opt/devstack
        ./stack.sh

    This step takes about 10-15 minutes, it needs an internet connection,
    however the expected downloaded data stays low if using a fresh enough
    appliance.

### Roll your own image

Essentially the same procedure, with exporting an ova archive at the end which
then can be distributed and easily import into VirtualBox

`./create-training-box.sh` is a handy tool that sets up everything with vagrant
and then creates the distributable box file.

### Learn how to easily set up devstack

* [install-base.sh](install-base.sh) and 
  [install-devstack.sh](install-devstack.sh) - commands used during provisioning
* [files/](files/) - configuration files copied into the vm

Getting around in the VM
------------------------

After booting up the virtual machine, start setting up devstack. It takes around
10 minutes to finish, until then you can get familiar with the environment the
VM provides you with.

Open up a terminal and run `/opt/devstack/stack.sh`

The four main software you will be using from the desktop during the training
are
* a browser (Firefox)
* a terminal emulator
* a text editor (Geany, vim)
* an IRC client (XChat)

The browser already contains a couple of handy bookmarks on the bookmark bar.
This document can be reached via the *VM Help* bookmark. When `stack.sh`
finished running, you can open the OpenStack Horizon Dashboard using the
*DevStack* bookmark.

DevStack install OpenStack software to `/opt/stack`. You can edit these files
using you preferred editor of choice. You can install any software from the
Ubuntu repoistories using the default `vagrant` user (no password needed for
sudo).

To log in to IRC, XChat is set up for you. Please make sure that you replace the
default user `vagrant` upon first start before logging in to Freenode channels.

The installed OpenStack cloud is capable of running virtual machines. However,
please keep in mind, due to the significant memory requirements of running a VM
your environment may not be capable to perform this task. Also note that the
default security groups are not modified, so if you want to ping or SSH into
your VM, you need to add the correct security rules (ICMP In/Egress from all,
SSH ingress from all). Also beware that sometimes Horizon logs you in into the
wrong project. To use the private networking by default, you need to log in as
the default `demo` user (password: `admin`) and select `demo` as project.

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

