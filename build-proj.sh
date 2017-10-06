#!/bin/sh

. ./versions.sh
VER=${PROJ_VER}
LOG=../../../${SGEN}-proj.log

rm -rf lib/src/proj-${VER}
rm -rf lib/install/proj-${VER}

mkdir -p lib/src
cd lib/src
tar xvzf ../../proj-${VER}.tar.gz
cd proj-${VER}
./configure --prefix=$(pwd)/../../install/proj-${VER}/release --without-jni | tee ${LOG}
make | tee -a ${LOG}
make install | tee -a ${LOG}
cd ../../..
