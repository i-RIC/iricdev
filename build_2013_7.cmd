@echo off
setlocal enableextensions

call versions.cmd
set GENERATOR="Visual Studio 12 2013 Win64"
set SGEN="vs2013-x64"
set VER=%NETCDF-VER%

if exist lib\src\netcdf-%VER%     rd /s /q lib\src\netcdf-%VER%
if exist lib\build\netcdf-%VER%   rd /s /q lib\build\netcdf-%VER%
if exist lib\install\netcdf-%VER% rd /s /q lib\install\netcdf-%VER%

7z x netcdf-%VER%.zip -o"lib\src"

REM ctest -S build-netcdf.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O build-netcdf-debug.log
REM ctest -S build-netcdf.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O build-netcdf-release.log
ctest -S build-netcdf.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-netcdf-debug.log
ctest -S build-netcdf.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-netcdf-release.log

endlocal
