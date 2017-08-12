#!/bin/sh

. ./versions.sh
VER=$GDAL_VER
LOG=../../../${SGEN}-gdal.log

rm -rf lib/src/gdal-${VER}
rm -rf lib/install/gdal-${VER}

cd lib/src
tar xvzf ../../gdal-${VER}.tar.gz
cd gdal-${VER}
./configure --prefix=$(pwd)/../../install/gdal-${VER} --without-jasper --without-hdf5 | tee ${LOG}
make -j 12 lib-target | tee -a ${LOG}
make -k install | tee -a ${LOG}
cd ../../..
