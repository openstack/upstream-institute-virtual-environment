OpenStack upstream training virtual environment
===============================================

This repository contains a Vagrant-based devstack setup. It installs the
necessary components in an Ubuntu machine along with basic GUI features to be
able to start hacking on OpenStack!

The output
----------

!!! TODO !!!

Usage
-----

You can either use vagrant to set up the environment, roll your own VirtualBox
image or just follow the installation script to manually set up devstack.

# Using Vagrant

This method actually sets up everything including devstack. It takes a fair
amount of time (more than 30 minutes based on the internet connection)

1. Set up VirtualBox
2. Set up Vagrant
3. `git clone **TODO**`
4. `cd openstack-upstream-training`
5. `vagrant up`
6. `vagrant reload`

# Roll your own image

Essentially the same procedure, with exporting an ova archive at the end which
then can be distributed and easily import into VirtualBox

`./create-training-box.sh` is a handy tool that sets up everythong with vagrant
and then creates the distributable box file.

# Learn how to easily set up devstack

Browse ***TODO*** this repository to learn what these scripts do.

License
-------
MIT



