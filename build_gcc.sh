#!/bin/sh

GENERATOR="Unix Makefiles"
SGEN="gcc"

export GENERATOR SGEN

./build-vtk.sh
./build-hdf5.sh
./build-cgnslib.sh
./build-iriclib.sh
./build-shapelib.sh
./build-qwt.sh
./build-gdal.sh
./build-proj.sh
./build-netcdf.sh
./build-geos.sh
./build-boost.sh
./build-yaml-cpp.sh

./create-paths-pri.sh > paths.pri
./create-dirExt-prop.sh > dirExt.prop
