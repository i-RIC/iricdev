#!/bin/sh

. ./versions.sh
VER=$GDAL_VER

rm -rf lib/src/gdal-${VER}
rm -rf lib/install/gdal-${VER}

cd lib/src
tar xvzf ../../gdal-${VER}.tar.gz
cd gdal-${VER}
./configure --prefix=/home/charlton/iricdev_icc/lib/install/gdal-${VER} --without-jasper --without-hdf5
make
make install
cd ../../..
