#!/bin/bash
. ./versions.sh

if [ ! -f "VTK-${VTK_VER}.tar.gz" ]; then
  MAJOR=$(echo ${VTK_VER} | cut -d '.' -f 1)
  MINOR=$(echo ${VTK_VER} | cut -d '.' -f 2)
  wget --no-check-certificate http://www.vtk.org/files/release/${MAJOR}.${MINOR}/VTK-${VTK_VER}.tar.gz
fi

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

if [ ! -f "shapelib-${SHAPELIB_VER}.tar.gz" ]; then
  wget --no-check-certificate http://download.osgeo.org/shapelib/shapelib-${SHAPELIB_VER}.tar.gz
fi

if [ ! -f "qwt-${QWT_VER}.tar.bz2" ]; then
  wget --no-check-certificate https://sourceforge.net/projects/qwt/files/qwt/${QWT_VER}/qwt-${QWT_VER}.tar.bz2
fi

if [ ! -f "gdal-${GDAL_VER}.tar.gz" ]; then
  wget --no-check-certificate http://download.osgeo.org/gdal/${GDAL_VER}/gdal-${GDAL_VER}.tar.gz
fi

if [ ! -f "proj-${PROJ_VER}.tar.gz" ]; then
  wget --no-check-certificate http://download.osgeo.org/proj/proj-${PROJ_VER}.tar.gz
fi

if [ ! -f "netcdf-${NETCDF_VER}.tar.gz" ]; then
  wget --no-check-certificate ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-${NETCDF_VER}.tar.gz
fi

if [ ! -f "geos-${GEOS_VER}.tar.bz2" ]; then
  wget --no-check-certificate http://download.osgeo.org/geos/geos-${GEOS_VER}.tar.bz2
fi

if [ ! -f "boost_${BOOST_UVER}.tar.bz2" ]; then
  wget --no-check-certificate https://sourceforge.net/projects/boost/files/boost/${BOOST_VER}/boost_${BOOST_UVER}.tar.bz2
fi

if [ ! -f "yaml-cpp-release-${YAML_CPP_VER}.tar.gz" ]; then
  wget --no-check-certificate https://github.com/jbeder/yaml-cpp/archive/release-${YAML_CPP_VER}.tar.gz --output-document=yaml-cpp-release-${YAML_CPP_VER}.tar.gz
fi
