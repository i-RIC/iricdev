#!/bin/sh

if [ -z "${GENERATOR}" ]; then
  echo "No Generator has been set"
  exit 1
fi

. ./versions.sh
VER=${VTK_VER}

rm -rf lib/src/VTK-${VER}
rm -rf lib/build/vtk-${VER}
rm -rf lib/install/vtk-${VER}

mkdir -p lib/src
cd lib/src
tar xvzf ../../VTK-${VER}.tar.gz
cd ../..

ctest -S build-vtk.cmake -DCONF_DIR:STRING=debug   "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Debug   -VV -O ${SGEN}-vtk-debug.log
ctest -S build-vtk.cmake -DCONF_DIR:STRING=release "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Release -VV -O ${SGEN}-vtk-release.log
