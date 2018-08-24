@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo No Generator has been set
  exit /b 1
)

call versions.cmd
set VER=%UDUNITS_VER%

if exist lib\src\udunits-%VER%     rd /s /q lib\src\udunits-%VER%
if exist lib\build\udunits-%VER%   rd /s /q lib\build\udunits-%VER%
if exist lib\install\udunits-%VER% rd /s /q lib\install\udunits-%VER%

7z x udunits-%VER%.tar.gz -so | 7z x -si -ttar -o"lib\src"

ctest -S build-udunits.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-udunits-debug.log
ctest -S build-udunits.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-udunits-release.log

endlocal
