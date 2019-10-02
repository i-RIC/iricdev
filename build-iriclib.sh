#!/bin/bash

if [ -z "$GENERATOR" ]; then
  echo "No Generator has been set"
  exit 1
fi

. ./versions.sh
VER=$IRICLIB_VER

rm -rf lib/src/iriclib-${VER}
rm -rf lib/build/iriclib-${VER}
rm -rf lib/install/iriclib-${VER}

mkdir -p lib/src
cd lib/src
unzip ../../iriclib-${VER}.zip
mv iriclib-$VER iriclib-${VER}
cd ../..

ctest -S build-iriclib.cmake -DCONF_DIR:STRING=debug   "-DCTEST_CMAKE_GENERATOR:STRING=$GENERATOR" -C Debug   -VV -O $SGEN-iriclib-debug.log
ctest -S build-iriclib.cmake -DCONF_DIR:STRING=release "-DCTEST_CMAKE_GENERATOR:STRING=$GENERATOR" -C Release -VV -O $SGEN-iriclib-release.log
