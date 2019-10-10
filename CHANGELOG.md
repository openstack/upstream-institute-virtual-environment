# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)

## Unreleased
- Moved to bionic (18.04 LTS)

### Changed
- Oracle VirtualBox 6.0 is the minimum version for this bundle

### Fixed
- Switched to VBoxSVGA controller

## [v2019.01] Denver summit

### Changed
- Moved to bionic (18.04 LTS)

### Fixed
- Updated README with correct links and easier to follow instructions
- Fixed bookmarks in Firefox

### Added
- `import-virsh` script to convert ova archive to libvirt qemu/kvm format

## [v2018.02] Berlin summit

### Changed
- Changed from Vagrant provisioning to disk-image-creator
- Fixed version to Ubuntu Xenial Xerus (16.04 LTS)

### Added
- Kept Vagrantfile to provision a CentOS VM that can build the Traning VM
- Updated documentation for Virtualbox

### Fixed
- Storage is SSD by default (caused problems with volume groups under MacOS)
- Virtualbox modesetting driver works correctly
- Passwords are consistently set to `openstack`

[v2018.02]: https://github.com/openstack/upstream-institute-virtual-environment/compare/v2017.01.1...v2018.02

## [v2017.01.1] Boston summit - Patch #1

### Changed
- Devstack installation is forced to use systemd instead of screen

### Fixed
- Works with VMware player

[v2017.01.1]: https://github.com/openstack/upstream-institute-virtual-environment/compare/v2017.01...v2017.01.1

## [v2017.01] Boston summit

### Changed
- Image is now based on Ubuntu Xenial 16.04 LTS
- Image download is much smaller, around 1.1G (was ~2G)
- VM runs on less memory (minimum 4G, recommended 6G)
- Default user is now ubuntu, password is openstack
- HexChat instead of XChat
- Project renamed to Upstream Institute ;-)

### Added
- `optimize-memory` for lowering runtime memory needs
- `cleanup.sh` script that helps shrinking the image

### Fixed
- There's no need to fiddle with network settings anymore

[v2017.01]: https://github.com/openstack/upstream-institute-virtual-environment/compare/v2016.02...v2017.01

## [v2016.02] Barcelona summit

- Initial release

[v2016.02]: https://github.com/openstack/upstream-institute-virtual-environment/tree/v2016.02
