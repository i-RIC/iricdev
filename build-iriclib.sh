#!/bin/bash

if [ -z "$GENERATOR" ]; then
  echo "No Generator has been set"
  exit 1
fi

. ./versions.sh
VER=$IRICLIB_VER

rm -rf lib/src/iriclib-${VER:0:7}
rm -rf lib/build/iriclib-${VER:0:7}
rm -rf lib/install/iriclib-${VER:0:7}

mkdir -p lib/src
cd lib/src
unzip ../../iriclib-${VER:0:7}.zip
mv iriclib-$VER iriclib-${VER:0:7}
cd ../..

ctest -S build-iriclib.cmake -DCONF_DIR:STRING=debug   "-DCTEST_CMAKE_GENERATOR:STRING=$GENERATOR" -C Debug   -V -O $SGEN-iriclib-debug.log
ctest -S build-iriclib.cmake -DCONF_DIR:STRING=release "-DCTEST_CMAKE_GENERATOR:STRING=$GENERATOR" -C Release -V -O $SGEN-iriclib-release.log
