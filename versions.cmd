@echo off
REM
REM versions.cmd
REM
set VTK_VER=6.1.0
REM set HDF5_VER=1.8.13
set HDF5_VER=1.8.14
set CGNSLIB_VER=3.2.1
for /f %%h in ('git ls-remote https://github.com/i-RIC/iriclib.git HEAD') do set IRICLIB_VER=%%h
set SHAPELIB_VER=1.3.0
REM set QWT_VER=6.1.0
set QWT_VER=6.1.3
set GDAL_VER=1.11.2
set PROJ_VER=4.8.0
REM set NETCDF_VER=4.3.2
set NETCDF_VER=4.3.3
REM set GEOS_VER=3.4.2
set GEOS_VER=3.4.3
set BOOST_VER=1.59.0
set YAML_CPP_VER=0.5.2
REM
REM replace . with _
REM
set BOOST_UVER=%BOOST_VER:.=_%

