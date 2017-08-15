#!/bin/sh

. ./versions.sh
VER=$QWT_VER

rm -rf lib/src/qwt-$VER
rm -rf lib/install/qwt-$VER

mkdir -p lib/src
cd lib/src
tar xvjf ../../qwt-$VER.tar.bz2
cd ../..

# use cmake to modify qwtconfig.pri
ctest -S build-qwt.cmake "-DVER=$VER"

# build and install
cd lib/src/qwt-$VER
qmake
make
make install
cd ../../..
