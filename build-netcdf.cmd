@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo No Generator has been set
  exit /b 1
)

call versions.cmd
set VER=%NETCDF_VER%

if exist lib\src\netcdf-%VER%     rd /s /q lib\src\netcdf-%VER%
if exist lib\build\netcdf-%VER%   rd /s /q lib\build\netcdf-%VER%
if exist lib\install\netcdf-%VER% rd /s /q lib\install\netcdf-%VER%

7z x netcdf-%VER%.zip -o"lib\src"

ctest -S build-netcdf.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-netcdf-debug.log
ctest -S build-netcdf.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-netcdf-release.log

endlocal
