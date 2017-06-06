#!/bin/sh

CC=icc
CXX=icpc
GENERATOR="Unix Makefiles"
SGEN="icc"

export CC CXX GENERATOR SGEN

#. ./build-vtk.sh
. ./build-hdf5.sh
. ./build-cgnslib.sh
. ./build-iriclib.sh
#. ./build-shapelib.sh
#. ./build-qwt.sh
#. ./build-gdal.sh
#. ./build-proj.sh
#. ./build-netcdf.sh
#. ./build-geos.sh
#. ./build-boost.sh
#. ./build-yaml-cpp.sh

#call create-paths-pri.cmd > paths.pri
#call create-dirExt-prop.cmd > dirExt.prop
