#!/bin/sh

if [ -z "$GENERATOR" ]; then
  echo "No Generator has been set"
  exit 1
fi

. ./versions.sh

rm -rf lib/src/iriclib
rm -rf lib/build/iriclib
rm -rf lib/install/iriclib

mkdir -p lib/src
cd lib/src
git clone --branch develop https://github.com/scharlton2/iriclib-test.git iriclib
cd ../..

ctest -S build-iriclib.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING="Unix Makefiles" -C Debug   -V -O $SGEN-iriclib-debug.log
ctest -S build-iriclib.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING="Unix Makefiles" -C Release -V -O $SGEN-iriclib-release.log
