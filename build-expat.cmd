@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo No Generator has been set
  exit /b 1
)

call versions.cmd
set VER=%EXPAT_VER%

if exist lib\src\expat-%VER%     rd /s /q lib\src\expat-%VER%
if exist lib\build\expat-%VER%   rd /s /q lib\build\expat-%VER%
if exist lib\install\expat-%VER% rd /s /q lib\install\expat-%VER%

7z x expat-%VER%.zip -o"lib\src"
move lib\src\libexpat-%EXPAT_UVER% lib\src\expat-%VER%

ctest -S build-expat.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-expat-debug.log
ctest -S build-expat.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-expat-release.log

endlocal
