OpenStack Upstream Institute Virtual Environment
================================================

<h2 align=center>bit.ly/<a href=http://bit.ly/upstream-institute-vm>upstream-institute-vm</a></h2>

Instructions
------------

### Using VirtualBox

1. Set up [VirtualBox]
2. Go to the [releases] page and download the [latest VM image][image].
3. Import  the `ova` file  (`File` ->  `Import appliance...`)
    > on  Windows? look [here][ova-import-help].)
4. Start up the VM

### Using VMware player

1. Set up [VMware player]
2. Go to the [releases] page and download the [latest VM image][image].
3. Open the `ova` file (`File` -> `Open a Virtual Machine`)
    > A warning dialog might appear. Click on `Retry`
4. Start up the VM

[VirtualBox]: https://www.virtualbox.org/wiki/Downloads
[VMware player]: http://www.vmware.com/products/player/playerpro-evaluation.html
[image]: https://github.com/kmARC/openstack-training-virtual-environment/releases/download/next/upstream-training-alpha.ova
[releases]: https://github.com/kmARC/openstack-training-virtual-environment/releases
[ova-import-help]: README-virtualbox-import.md

### Minimum requirements

* 5GB of **free** RAM (so at least 8GB in your laptop)
* Recent CPU with at least 4 cores
* 15GB disk space


Getting around in the VM
------------------------

1. Explore the environment. The four main software you will be using from the
    desktop during the training are:
    * **Firefox** web browser
    * **Xfce4-terminal** terminal emulator
    * **Geany** text editor
    * **HexChat** IRC client
        > please make sure that you replace the default user `ubuntu` upon first
        > start before logging in to Freenode channels.

2. When `stack.sh` finished running, you can open your [Horizon Dashboard]
    (http://localhost/) or on VirtualBox using the **DevStack** bookmark

    * **Login**: `demo`
    * **Password**: `openstack`

3. Select the `demo` project

4. Start a VM. Use a tiny flavor. A CirrOS image is already set up by devstack

5. Assign a floating IP

6. Enable SSH and ICMP ports on the security groups

[Horizon Dashboard]: http://localhost/

Learn how to set up devstack
----------------------------

These are the steps used to provision the vm:
* [install-base.sh](install-base.sh) - Git and dependent packages
* [install-devstack.sh](install-devstack.sh) - Devstack
* [install-gui.sh](install-gui.sh) - Xfce desktop environment, GUI applications
* [files/](files/) - configuration files copied into the vm

Using latest devstack
---------------------

Please  do  not update  your  openstack  installation  during the  training.  It
requires bandwidth.

If you want to keep on using the training VM for devstacking, you should disable
offline mode in [local.conf](files/opt/devstack/local.conf). Also reconsider git
related settings here.

Screenshots
-----------

| ![devstack] | ![geany]    | ![git-hexchat] |
|-------------|-------------|----------------|
| devstack    | text editor | git and irc    |

[devstack]: docs/01.png "Devstack running"
[geany]: docs/02.png "Geany with keystone code loaded"
[git-hexchat]: docs/03.png "git and HexChat"

Advanced Topics
---------------

This section is mainly for developers of the *VM*, on the training you won't
need this.

**Roll your own image**

The image can be built using [diskimage-builder][dib].

1. Install prerequisites
    ```bash
    ./prereqs.sh
    ```
    This step needs root/sudo rights to install tools like qemu-img
2. Activate the python virtual environment
    ```bash
    . .env/bin/activate
    ```
3. Create disk image with provided convenience script
    ```bash
    ./create-training-box.sh
    ```
4. The generated image can be found under `dist/`

[dib]: https://docs.openstack.org/diskimage-builder/latest/

License
-------
MIT

