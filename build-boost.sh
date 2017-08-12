#!/bin/sh

. ./versions.sh
VER=${BOOST_VER}
UVER=${BOOST_UVER}

rm -rf lib/src/boost_${UVER}
rm -rf lib/src/boost-${VER}

mkdir -p lib/src
cd lib/src
tar xjvf ../../boost_${UVER}.tar.bz2
mv boost_${UVER} boost-${VER}
cd ../..
