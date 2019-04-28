OpenStack Upstream Institute Virtual Environment
================================================

<h2 align=center>bit.ly/<a href=http://bit.ly/upstream-institute>upstream-institute</a></h2>

Instructions
------------

### Using VirtualBox

1. Set up [VirtualBox] with [Extension Pack]
2. Download the [latest VM image][image].
3. Import  the `ova` file  (`File` ->  `Import appliance...`)
    > on  Windows? look [here][ova-import-help].)
4. Start up the VM

### Using VMware player

1. Set up [VMware player]
2. Download the [latest VM image][image].
3. Open the `ova` file (`File` -> `Open a Virtual Machine`)
    > A warning dialog might appear. Click on `Retry`
4. Start up the VM

[Extension Pack]: http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html#extpack
[image]: http://bit.ly/vm-2019-denver-v1
[ova-import-help]: README-virtualbox-import.md
[VirtualBox]: https://www.virtualbox.org/wiki/Downloads
[VMware player]: http://www.vmware.com/products/player/playerpro-evaluation.html

### Minimum requirements

* 5GB of **free** RAM (so at least 8GB in your laptop)
* Recent CPU with at least 4 cores
* 15GB disk space


Getting around in the VM
------------------------

1. Run `stack.sh` to install devstack. It might take 10-20 minutes.

    ```bash
    cd /opt/devstack
    ./stack.sh
    ```

2. Explore the environment. The four main software you will be using from the
    desktop during the training are:
    * **Firefox** web browser
    * **Xfce4-terminal** terminal emulator
    * **Geany** text editor
    * **HexChat** IRC client
        > please make sure that you replace the default user `ubuntu` upon first
        > start before logging in to Freenode channels.
    * **DevStack** is run from /opt/devstack
    * **OpenStack** source code is placed to /opt/stack

3. When `stack.sh` finished running, you can  open your [Horizon Dashboard] or on VirtualBox using
   the **DevStack** bookmark

    * **Login**: `demo`
    * **Password**: `openstack`

[Horizon Dashboard]: http://localhost/dashboard

5. In the upper left corner, switch from `invisible_to_admin` to the `demo` project

6. Start a VM (no volume needed, use the nano flavor). A CirrOS image is already set up by devstack

7. Associate a floating IP. Initially, no Floating IP's allocated, you can add one with the `+`
   button. An example would be `172.124.4.45`. It may stuck at the loading screen - in this case,
   reload the dashboard.

8. Enable SSH and ICMP ports on the default security group. Select "Network" -> "Security groups"
   and "Manage rules" -> "Add rule"

9. Try to connect with SSH to the floating IP.

    ```bash
    $ ssh root@<FLOATING_IP> -l cirros # password: gocubsgo

    # Example: ssh root@172.24.4.45 -l cirros
    ```

10. DNS might not work in the cirros vm, in this case:

    ```bash
    echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf`
    ```

11. **IMPORTANT**: To keep your devstack environment across reboots, **do not reboot / halt the VM**,
   but instead use "Save the machine state" from VirtualBox quit dialog.

Devstack installs using the [99-devstack.sh](elements/upstream-training/install.d/99-devstack.sh)
script.

Using latest devstack
---------------------

Please **do not** update your openstack installation during the training. It requires bandwidth.

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

The image can be built using [diskimage-builder][dib] in a convenience vagrant machine from
[vm-creator-vm](./vm-creator-vm/) directory


1. Spin up vm-creator-vm:
    ```bash
    cd vm-creator-vm/
    vagrant up
    vagrant ssh
    cd git-repo # this directory contains the git repository of the upsteram-institute-vm
    ```
    This will boot up a VirtualBox VM with CentOS 7

2. Install prerequisites in the VM
    ```bash
    ./prereqs.sh
    ```
    This step needs root/sudo rights to install tools like qemu-img
3. Activate the python virtual environment
    ```bash
    . .env/bin/activate
    ```
4. Create disk image with provided convenience script
    ```bash
    ./create-training-box.sh
    ```
5. The generated image can be found under `dist/`

[dib]: https://docs.openstack.org/diskimage-builder/latest/

License
-------
MIT

