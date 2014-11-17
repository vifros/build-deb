#!/bin/bash

set -u
set -e

# TODO: Do code every single step below.
#
# 0- Check that we have the needed commands to build the deb. Ex: npm.
#
## Exit if npm is not installed.
#if [ -x "npm" ]; then
#  echo "Please install npm. Is usually installed while installing nodejs."
#  exit 1
#fi
#
# 1- Install vifros source with npm into the /opt folder.
# 2- Update deb-src with the data extracted of downloaded source:
#      a- Version: 0.0
#      b- Depends: nodejs (>= 0.8)
# 3- Execute fakeroot dpkg-deb --build deb-src vifros-0.0-1.deb to
#    build the deb. Update the version.