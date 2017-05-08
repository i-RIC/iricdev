@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo No Generator has been set
  exit /b 1
)

call versions.cmd
set VER=%CGNSLIB-VER%

if exist lib\src\cgnslib-%VER%     rd /s /q lib\src\cgnslib-%VER%
if exist lib\build\cgnslib-%VER%   rd /s /q lib\build\cgnslib-%VER%
if exist lib\install\cgnslib-%VER% rd /s /q lib\install\cgnslib-%VER%

7z x cgnslib_%VER%.tar.gz -so | 7z x -si -ttar -o"lib\src"
ren lib\src\cgnslib_%VER% cgnslib-%VER%

ctest -S build-cgnslib.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-cgnslib-debug.log
ctest -S build-cgnslib.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-cgnslib-release.log

endlocal
