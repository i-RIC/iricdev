@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo No Generator has been set
  exit /b 1
)

call versions.cmd
set VER=%CGNSLIB_VER%

if "%CGNSLIB_VER%"=="3.2.1" (
  set VER=%CGNSLIB_VER%-patch2
  if exist lib\src\cgnslib-%VER%     echo WARNING lib\src\cgnslib-%VER% exists NOT DELETING!
) else (
  if exist lib\src\cgnslib-%VER%     rd /s /q lib\src\cgnslib-%VER%
)

if exist lib\build\cgnslib-%VER%   rd /s /q lib\build\cgnslib-%VER%
if exist lib\install\cgnslib-%VER% rd /s /q lib\install\cgnslib-%VER%

if "%CGNSLIB_VER%"=="3.2.1" (
  if NOT exist lib\src\cgnslib-3.2.1-patch2 (
    git clone --branch add_flush git@github.com:kskinoue0612/CGNS.git lib/src/cgnslib-%VER%
  )
) else (
  7z x cgnslib_%VER%.tar.gz -so | 7z x -si -ttar -o"lib\src"
  ren lib\src\cgnslib_%VER% cgnslib-%VER%
)

ctest -S build-cgnslib.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-cgnslib-debug.log
ctest -S build-cgnslib.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-cgnslib-release.log

endlocal
