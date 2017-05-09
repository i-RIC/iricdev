@echo off
setlocal enableextensions

call versions.cmd
set VER=%PROJ-VER%

if exist lib\src\proj-%VER%     rd /s /q lib\src\proj-%VER%
if exist lib\build\proj-%VER%   rd /s /q lib\build\proj-%VER%
if exist lib\install\proj-%VER% rd /s /q lib\install\proj-%VER%

7z x proj-%VER%.zip -o"lib\src"

set topdir=%~dp0

pushd lib\src\proj-%VER%
nmake -f makefile.vc INSTDIR=%topdir%\lib\install\proj-%VER%\release
nmake -f makefile.vc INSTDIR=%topdir%\lib\install\proj-%VER%\release install-all
popd

endlocal
