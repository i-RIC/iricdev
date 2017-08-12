#!/bin/sh

if [ -z "$GENERATOR" ]; then
  echo "No Generator has been set"
  exit 1
fi

. ./versions.sh
VER=$CGNSLIB_VER

rm -rf lib/src/cgnslib-$VER
rm -rf lib/build/cgnslib-$VER
rm -rf lib/install/cgnslib-$VER

mkdir -p lib/src
cd lib/src
tar xvzf ../../cgnslib_$VER.tar.gz
mv cgnslib_$VER cgnslib-$VER
cd ../..

ctest -S build-cgnslib.cmake -DCONF_DIR:STRING=debug   "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Debug   -VV -O ${SGEN}-cgnslib-debug.log
ctest -S build-cgnslib.cmake -DCONF_DIR:STRING=release "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Release -VV -O ${SGEN}-cgnslib-release.log
