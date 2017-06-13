@echo off
setlocal enableextensions

pushd .
call "C:\Qt\5.5\msvc2013_64\bin\qtenv2.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
popd

set GENERATOR="Visual Studio 12 2013 Win64"
set SGEN="vs2013-x64"

REM call build-vtk.cmd
call build-hdf5.cmd
call build-cgnslib.cmd
call build-iriclib.cmd
REM call build-shapelib.cmd
REM call build-qwt.cmd
REM call build-gdal.cmd
REM call build-proj.cmd
REM call build-netcdf.cmd
REM call build-geos.cmd
REM call build-boost.cmd
REM call build-yaml-cpp.cmd

call create-paths-pri.cmd > paths.pri
call create-dirExt-prop.cmd > dirExt.prop

endlocal
