@echo off
setlocal enableextensions

set GENERATOR="Visual Studio 12 2013 Win64"
set SGEN="vs2013-x64"

if exist lib\src\cgnslib-3.2.1   rd /s /q lib\src\cgnslib-3.2.1
if exist lib\build\cgnslib-3.2.1 rd /s /q lib\build\cgnslib-3.2.1

7z x cgnslib_3.2.1.tar.gz -so | 7z x -si -ttar -o"lib\src"
ren lib\src\cgnslib_3.2.1 cgnslib-3.2.1

ctest -S build-cgnslib.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O build-cgnslib-debug.log
ctest -S build-cgnslib.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O build-cgnslib-release.log

endlocal
