#!/bin/sh

if [ -z "${GENERATOR}" ]; then
  echo "No Generator has been set"
  exit 1
fi

. ./versions.sh
VER=${GEOS_VER}

rm -rf "lib/src/geos-${VER}"
rm -rf "lib/build/geos-${VER}"
rm -rf "lib/install/geos-${VER}"

mkdir -p lib/src
cd lib/src
tar xvjf ../../geos-${VER}.tar.bz2
cd ../..

ctest -S build-geos.cmake -DCONF_DIR:STRING=debug   "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Debug   -VV -O ${SGEN}-geos-debug.log
ctest -S build-geos.cmake -DCONF_DIR:STRING=release "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Release -VV -O ${SGEN}-geos-release.log
