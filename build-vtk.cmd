@echo off
setlocal enableextensions

if [%GENERATOR%]==[] (
  echo No Generator has been set
  exit /b 1
)

call versions.cmd
set VER=%VTK_VER%

if exist lib\src\VTK-%VER%     rd /s /q lib\src\VTK-%VER%
if exist lib\build\VTK-%VER%   rd /s /q lib\build\VTK-%VER%
if exist lib\install\VTK-%VER% rd /s /q lib\install\VTK-%VER%

7z x VTK-%VER%.zip -o"lib\src"

ctest -S build-vtk.cmake -DCONF_DIR:STRING=debug   -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Debug   -VV -O %SGEN%-vtk-debug.log
ctest -S build-vtk.cmake -DCONF_DIR:STRING=release -DCTEST_CMAKE_GENERATOR:STRING=%GENERATOR% -C Release -VV -O %SGEN%-vtk-release.log

endlocal
