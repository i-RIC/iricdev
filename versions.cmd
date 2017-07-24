@echo off
REM
REM versions.cmd
REM
set VTK-VER=6.1.0
REM set HDF5-VER=1.8.13
set HDF5-VER=1.8.14
set CGNSLIB-VER=3.2.1
for /f %%h in ('git ls-remote https://github.com/i-RIC/iriclib.git HEAD') do set IRICLIB_VER=%%h
set SHAPELIB-VER=1.3.0
REM set QWT-VER=6.1.0
set QWT-VER=6.1.3
set GDAL-VER=1.11.2
set PROJ-VER=4.8.0
REM set NETCDF-VER=4.3.2
set NETCDF-VER=4.3.3
REM set GEOS-VER=3.4.2
set GEOS-VER=3.4.3
set BOOST-VER=1.59.0
set YAML-CPP-VER=0.5.2
REM
REM replace . with _
REM
set BOOST_UVER=%BOOST-VER:.=_%
if [%BUILD_TOOLS%]==[] (
  set BUILD_TOOLS="OFF"
)
