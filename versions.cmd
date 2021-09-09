@echo off
::
:: versions.cmd
::
set VTK_VER=6.1.0
set HDF5_VER=1.8.14
set CGNSLIB_VER=3.2.1
set IRICLIB_VER=0.2.3
set IRICLIB_ADF_VER=0.2
set SHAPELIB_VER=1.3.0
set QWT_VER=6.1.3
set GDAL_VER=1.11.2
set POCO_VER=1.9.4
set PROJ_VER=4.8.0
set NETCDF_VER=4.3.3
set GEOS_VER=3.4.3
set BOOST_VER=1.59.0
set YAML_CPP_VER=0.5.2
set EXPAT_VER=2.2.6
set UDUNITS_VER=2.2.28
set OPENSSL_VER=1.0.2p
set LIBPNG_VER=1.6.37

::
:: replace . with _
::
set BOOST_UVER=%BOOST_VER:.=_%
set EXPAT_UVER=R_%EXPAT_VER:.=_%
set OPENSSL_UVER=%OPENSSL_VER:.=_%
if NOT defined BUILD_TOOLS  set BUILD_TOOLS="OFF"

:: nmake cannot create environment variables
if NOT defined GENERATOR    set GENERATOR="Visual Studio 12 2013 Win64"
if NOT defined SGEN         set SGEN=vs2013-x64
set VERSIONS_CMD_RUN=YES
