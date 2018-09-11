#!/bin/sh
VTK_VER=6.1.0
HDF5_VER=1.8.14
CGNSLIB_VER=3.2.1
IRICLIB_VER=$(git ls-remote https://github.com/i-RIC/iriclib.git HEAD | cut -f1)
SHAPELIB_VER=1.3.0
QWT_VER=6.1.3
GDAL_VER=1.11.2
PROJ_VER=4.8.0
NETCDF_VER=4.3.3
GEOS_VER=3.4.3
BOOST_VER=1.59.0
YAML_CPP_VER=0.5.2
EXPAT_VER=2.2.6
UDUNITS_VER=2.2.26
OPENSSL_VER=1.0.2p

#
# replace . with _
#
BOOST_UVER=$(echo $BOOST_VER | sed 's/\./_/g')
EXPAT_UVER=$(echo R_$EXPAT_VER | sed 's/\./_/g')
OPENSSL_UVER=$(echo $OPENSSL_VER | sed 's/\./_/g')

export VTK_VER HDF5_VER CGNSLIB_VER IRICLIB_VER SHAPELIB_VER QWT_VER
export GDAL_VER PROJ_VER NETCDF_VER GEOS_VER BOOST_VER YAML_CPP_VER
export EXPAT_VER UDUNITS_VER BOOST_UVER EXPAT_UVER
export OPENSSL_VER OPENSSL_UVER

if [ -z "$BUILD_TOOLS" ]; then
  BUILD_TOOLS="OFF"
fi
export BUILD_TOOLS
