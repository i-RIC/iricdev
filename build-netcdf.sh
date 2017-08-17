#!/bin/sh

if [ -z "${GENERATOR}" ]; then
  echo "No Generator has been set"
  exit 1
fi

. ./versions.sh
VER=${NETCDF_VER}

rm -rf lib/src/netcdf-${VER}
rm -rf lib/build/netcdf-${VER}
rm -rf lib/install/netcdf-${VER}

mkdir -p lib/src
cd lib/src
tar xvzf ../../netcdf-${VER}.tar.gz
cd ../..

ctest -S build-netcdf.cmake -DCONF_DIR:STRING=debug   "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Debug   -VV -O ${SGEN}-netcdf-debug.log
ctest -S build-netcdf.cmake -DCONF_DIR:STRING=release "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Release -VV -O ${SGEN}-netcdf-release.log
