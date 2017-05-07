# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)

## [Unreleased]

### Fixed
- Storage is SSD by default (caused problems with volume groups under MacOS)

[Unreleased]: https://github.com/kmarc/openstack-training-virtual-environment/compare/v2017.01.1...next

## [v2017.01.1] Boston summit - Patch #1

### Fixed
- Works with VMware player
- USE_SCREEN=True directive for devstack

[v2017.01.1]: https://github.com/kmarc/openstack-training-virtual-environment/compare/v2017.01...v2017.01.1

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

[v2017.01]: https://github.com/kmarc/openstack-training-virtual-environment/compare/v2016.02...v2017.01

## [v2016.02] Barcelona summit

- Initial release

[v2016.02]: https://github.com/kmarc/openstack-training-virtual-environment/tree/v2016.02
