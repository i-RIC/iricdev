#!/bin/sh

. ./versions.sh
VER=$SHAPELIB_VER

rm -rf lib/src/shapelib-$VER
rm -rf lib/install/shapelib-$VER

mkdir -p lib/src
cd lib/src
unzip ../../shapelib-$VER.zip
cd shapelib-$VER

# build and install release
make CFLAGS="-O3 -DNDEBUG -fPIC"
mkdir -p ../../install/shapelib-$VER/release/bin
mkdir -p ../../install/shapelib-$VER/release/include
mkdir -p ../../install/shapelib-$VER/release/lib
make PREFIX="../../install/shapelib-$VER/release" install

# build and install debug
make clean
make 
mkdir -p ../../install/shapelib-$VER/debug/bin
mkdir -p ../../install/shapelib-$VER/debug/include
mkdir -p ../../install/shapelib-$VER/debug/lib
make PREFIX="../../install/shapelib-$VER/debug" install
