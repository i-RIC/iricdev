@echo off
setlocal enableextensions

set GENERATOR="Visual Studio 12 2013 Win64"
set SGEN="vs2013-x64"

if exist lib\src\hdf5-1.8.14   rd /s /q lib\src\hdf5-1.8.14
if exist lib\build\hdf5-1.8.14 rd /s /q lib\build\hdf5-1.8.14

::mkdir lib\src\hdf5-1.8.14

7z x ZLib.tar.gz -so | 7z x -si -ttar -o"lib\src\hdf5-1.8.14"
7z x SZip.tar.gz -so | 7z x -si -ttar -o"lib\src\hdf5-1.8.14"
7z x hdf5-1.8.14.zip -o"lib\src\hdf5-1.8.14"

ctest -S build-zlib.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O build-zlib-debug.log
ctest -S build-zlib.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O build-zlib-release.log

ctest -S build-szip.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O build-szip-debug.log
ctest -S build-szip.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O build-szip-release.log

ctest -S build-hdf5.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O build-hdf5-debug.log
ctest -S build-hdf5.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%SGEN% -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O build-hdf5-release.log

endlocal
