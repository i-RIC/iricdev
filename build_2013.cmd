@echo off
setlocal enableextensions

pushd .
call "C:\Qt\5.5\msvc2013_64\bin\qtenv2.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
popd

set GENERATOR="Visual Studio 12 2013 Win64"
set SGEN="vs2013-x64"

call build-vtk.cmd
call build-hdf5.cmd
call build-cgnslib.cmd
call build-iriclib.cmd
call build-shapelib.cmd
call build-qwt.cmd
call build-gdal.cmd
call build-proj.cmd
call build-netcdf.cmd
call build-geos.cmd
call build-boost.cmd
call build-yaml-cpp.cmd

call create-files.cmd

endlocal
