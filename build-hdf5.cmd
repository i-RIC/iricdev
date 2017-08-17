@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo No Generator has been set
  exit /b 1
)

call versions.cmd
set VER=%HDF5_VER%

if exist lib\src\hdf5-%VER%     rd /s /q lib\src\hdf5-%VER%
if exist lib\build\hdf5-%VER%   rd /s /q lib\build\hdf5-%VER%
if exist lib\install\hdf5-%VER% rd /s /q lib\install\hdf5-%VER%

7z x hdf5-%VER%.zip -o"lib\src"

ctest -S build-hdf5.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-hdf5-debug.log
ctest -S build-hdf5.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-hdf5-release.log

endlocal
