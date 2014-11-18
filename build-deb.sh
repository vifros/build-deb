#!/bin/bash

set -u
set -e

BUILD=build
UPSTREAM_SRC=upstream-src
DEB_SRC=deb-src
DEBIAN=${DEB_SRC}/DEBIAN

#
# Check that we have the needed commands to build the deb. Ex: npm.
#
# Exit if npm is not installed.
if [ -x "npm" ]; then
  echo "Please install npm. Is usually installed while installing nodejs."
  exit 1
fi

# Cleans the upstream source folder and recreate it if not present.
rm -rf ${UPSTREAM_SRC}/*
mkdir -p ${UPSTREAM_SRC}

# Cleans the opt folder and recreate it if not present.
rm -rf ${DEB_SRC}/opt/*
mkdir -p ${DEB_SRC}/opt

# Cleans the final build folder and recreate it if not present.
rm -rf ${BUILD}/*
mkdir -p ${BUILD}

# Install vifros source with npm into /node_modules (easy way).
pushd ${UPSTREAM_SRC}/
  npm install git+https://github.com/vifros/vifros.git
popd

# Copy the DEBIAN folder to the build folder.
cp -r ${DEB_SRC}/* ${BUILD}

# Copy the upstream vifros folder to the BUILD/opt folder.
cp -r ${UPSTREAM_SRC}/node_modules/vifros ${BUILD}/opt

# Fix the perms in the downloaded vifros.
find ${BUILD}/opt/vifros -type d | xargs chmod 755
find ${BUILD}/opt/vifros -type f | xargs chmod go-w

# Get the downloaded vifros version.
pushd ${UPSTREAM_SRC}/node_modules/vifros
  VIFROS_VERSION=`grep -Po '"'"version"'"\s*:\s*"\K([^"]*)' package.json`-1
popd

# Update the vifros version on BUILD/DEBIAN/control.
pushd ${BUILD}/DEBIAN
  sed s"/#VERSION#/${VIFROS_VERSION}/" -i control
popd

# Build the deb package.
fakeroot dpkg-deb --build ${BUILD} vifros_${VIFROS_VERSION}_all.deb

# Clean the building folders.
rm -rf ${BUILD}/*
rm -rf ${UPSTREAM_SRC}/*

exit 0