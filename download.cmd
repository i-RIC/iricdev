@echo off
REM
REM download.cmd
REM
REM requires wget available from http://gnuwin32.sourceforge.net/packages/wget.htm
REM
REM wget --no-check-certificate http://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe
REM wget --no-check-certificate https://my.visualstudio.com/Downloads?pid=1901
REM wget --no-check-certificate https://cmake.org/files/v3.8/cmake-3.8.0-win64-x64.msi
REM wget --no-check-certificate http://prdownloads.sourceforge.net/nsis/nsis-3.01-setup.exe
REM
setlocal enableextensions enabledelayedexpansion
call versions.cmd
IF NOT EXIST "VTK-%VTK_VER%.zip" (
  REM pull off major and minor version (must use enabledelayedexpansion with exclamation points to work)
  for /f "tokens=1,2 delims=." %%a in ("%VTK_VER%") do set MAJOR.MINOR=%%a.%%b
  wget --no-check-certificate http://www.vtk.org/files/release/!MAJOR.MINOR!/VTK-%VTK_VER%.zip
)
IF NOT EXIST "hdf5-%HDF5_VER%.zip" (
  wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-%HDF5_VER%/cmake/SZip.tar.gz
  wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-%HDF5_VER%/cmake/ZLib.tar.gz
  wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-%HDF5_VER%/src/hdf5-%HDF5_VER%.zip
)
IF NOT EXIST "cgnslib_%CGNSLIB_VER%.tar.gz" (
  wget --no-check-certificate https://downloads.sourceforge.net/project/cgns/cgnslib_3.2/cgnslib_%CGNSLIB_VER%.tar.gz
)
IF NOT EXIST "iriclib-%IRICLIB_VER:~0,7%.zip" (
  wget --no-check-certificate https://github.com/i-RIC/iriclib/archive/%IRICLIB_VER%.zip --output-document=iriclib-%IRICLIB_VER:~0,7%.zip
)
IF NOT EXIST "shapelib-%SHAPELIB_VER%.zip" (
  wget --no-check-certificate http://download.osgeo.org/shapelib/shapelib-%SHAPELIB_VER%.zip
)
IF NOT EXIST "qwt-%QWT_VER%.zip" (
  wget --no-check-certificate https://sourceforge.net/projects/qwt/files/qwt/%QWT_VER%/qwt-%QWT_VER%.zip/download
)
IF NOT EXIST "gdal-%GDAL_VER%.tar.gz" (
  wget --no-check-certificate http://download.osgeo.org/gdal/%GDAL_VER%/gdal-%GDAL_VER%.tar.gz
)
IF NOT EXIST "proj-%PROJ_VER%.zip" (
  wget --no-check-certificate http://download.osgeo.org/proj/proj-%PROJ_VER%.zip
)
IF NOT EXIST "netcdf-%NETCDF_VER%.zip" (
  wget --no-check-certificate ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-%NETCDF_VER%.zip
)
IF NOT EXIST "geos-%GEOS_VER%.tar.bz2" (
  wget --no-check-certificate http://download.osgeo.org/geos/geos-%GEOS_VER%.tar.bz2
)
IF NOT EXIST "boost_%BOOST_UVER%.7z" (
  wget --no-check-certificate https://sourceforge.net/projects/boost/files/boost/%BOOST_VER%/boost_%BOOST_UVER%.7z/download
)
IF NOT EXIST "yaml-cpp-release-%YAML_CPP_VER%.zip" (
  wget --no-check-certificate https://github.com/jbeder/yaml-cpp/archive/release-%YAML_CPP_VER%.zip --output-document=yaml-cpp-release-%YAML_CPP_VER%.zip
)


endlocal
