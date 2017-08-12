#!/bin/sh

. ./versions.sh
VER=${SHAPELIB_VER}

rm -rf lib/src/shapelib-${VER}
rm -rf lib/install/shapelib-${VER}

mkdir -p lib/src
cd lib/src
tar xvzf ../../shapelib-${VER}.tar.gz
cd ../..

# build and install debug
cd lib/src/shapelib-${VER}
make
mkdir -p ../../install/shapelib-${VER}/debug
mkdir -p ../../install/shapelib-${VER}/debug/bin
mkdir -p ../../install/shapelib-${VER}/debug/include
mkdir -p ../../install/shapelib-${VER}/debug/lib
make PREFIX=$(pwd)/../../install/shapelib-${VER}/debug install
cd ../../..


# build and install release
cd lib/src/shapelib-${VER}
make clean
make CFLAGS="-O3 -DNDEBUG -fPIC"
mkdir -p ../../install/shapelib-${VER}/release
mkdir -p ../../install/shapelib-${VER}/release/bin
mkdir -p ../../install/shapelib-${VER}/release/include
mkdir -p ../../install/shapelib-${VER}/release/lib
make PREFIX=$(pwd)/../../install/shapelib-${VER}/release install
cd ../../..
