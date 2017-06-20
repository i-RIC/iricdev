#!/bin/bash
. ./versions.sh
if [ ! -f "hdf5-${HDF5_VER}.tar.gz" ]; then
  wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VER}/cmake/SZip.tar.gz
  wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VER}/cmake/ZLib.tar.gz
  wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VER}/src/hdf5-${HDF5_VER}.tar.gz
fi

if [ ! -f "cgnslib_${CGNSLIB_VER}.tar.gz" ]; then
  wget --no-check-certificate https://downloads.sourceforge.net/project/cgns/cgnslib_3.2/cgnslib_${CGNSLIB_VER}.tar.gz
fi

if [ ! -f "iriclib-${IRICLIB_VER:0:7}.zip" ]; then
  wget --no-check-certificate https://github.com/scharlton2/iriclib-test/archive/${IRICLIB_VER}.zip --output-document=iriclib-${IRICLIB_VER:0:7}.zip
fi

if [ ! -f "shapelib-${SHAPELIB_VER}.zip" ]; then
  wget --no-check-certificate http://download.osgeo.org/shapelib/shapelib-${SHAPELIB_VER}.zip
fi

if [ ! -f "qwt-${QWT_VER}.tar.bz2" ]; then
  wget --no-check-certificate https://sourceforge.net/projects/qwt/files/qwt/${QWT_VER}/qwt-${QWT_VER}.tar.bz2
fi

if [ ! -f "gdal-${GDAL_VER}.tar.gz" ]; then
  wget --no-check-certificate http://download.osgeo.org/gdal/${GDAL_VER}/gdal-${GDAL_VER}.tar.gz
fi
