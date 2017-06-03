#!/bin/sh

if [ -z "$GENERATOR" ]; then
  echo "No Generator has been set"
  exit 1
fi

. ./versions.sh
VER=$HDF5_VER

rm -rf lib/src/hdf5-$VER
rm -rf lib/build/hdf5-$VER
rm -rf lib/install/hdf5-$VER

mkdir -p lib/src
cd lib/src
tar xvzf ../../hdf5-$VER.tar.gz
cd ../..


ctest -S build-hdf5.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING="Unix Makefiles" -C Debug   -V -O $SGEN-hdf5-debug.log

ctest -S build-hdf5.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING="Unix Makefiles" -C Release -V -O $SGEN-hdf5-release.log

mv lib/install/hdf5-$VER/debug/share/*   lib/install/hdf5-$VER/debug/.
mv lib/install/hdf5-$VER/release/share/* lib/install/hdf5-$VER/release/.

rmdir lib/install/hdf5-$VER/debug/share
rmdir lib/install/hdf5-$VER/release/share
