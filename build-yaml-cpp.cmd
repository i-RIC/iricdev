@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo.No Generator has been set.
  echo.  ie
  echo.    set GENERATOR="Visual Studio 12 2013 Win64"
  echo.
  exit /b 1
)

call versions.cmd
set VER=%YAML_CPP_VER%

if exist lib\src\yaml-cpp-release-%VER% rd /s /q lib\src\yaml-cpp-release-%VER%
if exist lib\src\yaml-cpp-%VER%         rd /s /q lib\src\yaml-cpp-%VER%
if exist lib\build\yaml-cpp-%VER%       rd /s /q lib\build\yaml-cpp-%VER%
if exist lib\install\yaml-cpp-%VER%     rd /s /q lib\install\yaml-cpp-%VER%

7z x yaml-cpp-release-%VER%.zip -o"lib\src"
ren lib\src\yaml-cpp-release-%VER% yaml-cpp-%VER%

ctest -S build-yaml-cpp.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-yaml-cpp-debug.log
ctest -S build-yaml-cpp.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-yaml-cpp-release.log

endlocal
