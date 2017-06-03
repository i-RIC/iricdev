#!/bin/sh
. ./versions.sh
if [ ! -f "hdf5-${HDF5_VER}.tar.gz" ]; then
  wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VER}/cmake/SZip.tar.gz
  wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VER}/cmake/ZLib.tar.gz
  wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VER}/src/hdf5-${HDF5_VER}.tar.gz
fi

if [ ! -f "cgnslib_${CGNSLIB_VER}.tar.gz" ]; then
  wget --no-check-certificate https://downloads.sourceforge.net/project/cgns/cgnslib_3.2/cgnslib_${CGNSLIB_VER}.tar.gz
fi
