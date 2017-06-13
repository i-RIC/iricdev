@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo No Generator has been set
  exit /b 1
)

call versions.cmd
set VER=%IRICLIB_VER%

if exist lib\src\iriclib-%VER:~0,7%     rd /s /q lib\src\iriclib-%VER:~0,7%
if exist lib\build\iriclib-%VER:~0,7%   rd /s /q lib\build\iriclib-%VER:~0,7%
if exist lib\install\iriclib-%VER:~0,7% rd /s /q lib\install\iriclib-%VER:~0,7%

7z x iriclib-%IRICLIB_VER:~0,7%.zip -o"lib\src"
ren lib\src\iriclib-test-%VER% iriclib-%VER:~0,7%

ctest -S build-iriclib.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -V -O %SGEN%-iriclib-debug.log
ctest -S build-iriclib.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -V -O %SGEN%-iriclib-release.log

endlocal
