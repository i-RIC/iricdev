@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo No Generator has been set
  exit /b 1
)

call versions.cmd
set VER=%GEOS-VER%

if exist lib\src\geos-%VER%     rd /s /q lib\src\geos-%VER%
if exist lib\build\geos-%VER%   rd /s /q lib\build\geos-%VER%
if exist lib\install\geos-%VER% rd /s /q lib\install\geos-%VER%

7z x geos-%VER%.tar.bz2 -so | 7z x -si -ttar -o"lib\src"

ctest -S build-geos.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-geos-debug.log
ctest -S build-geos.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-geos-release.log

endlocal
