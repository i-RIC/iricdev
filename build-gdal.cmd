@echo off
setlocal enableextensions

call versions.cmd
set VER=%GDAL_VER%

if exist lib\src\gdal-%VER%     rd /s /q lib\src\gdal-%VER%
if exist lib\build\gdal-%VER%   rd /s /q lib\build\gdal-%VER%
if exist lib\install\gdal-%VER% rd /s /q lib\install\gdal-%VER%
if exist c:\warmerda            rd /s /q c:\warmerda

7z x gdal-%VER%.tar.gz -so | 7z x -si -ttar -o"lib\src"

mkdir lib\install\gdal-%VER%

pushd lib\src\gdal-%VER%
mkdir c:\warmerda\bld
nmake -f makefile.vc DEBUG=1 WIN64=YES MSVC_VER=1800
nmake -f makefile.vc DEBUG=1 WIN64=YES MSVC_VER=1800 devinstall
move c:\warmerda\bld ..\..\install\gdal-%VER%
ren ..\..\install\gdal-%VER%\bld debug
rd c:\warmerda
popd

pushd lib\src\gdal-%VER%
mkdir c:\warmerda\bld
nmake -f makefile.vc WIN64=YES MSVC_VER=1800 clean
nmake -f makefile.vc WIN64=YES MSVC_VER=1800
nmake -f makefile.vc WIN64=YES MSVC_VER=1800 devinstall
move c:\warmerda\bld ..\..\install\gdal-%VER%
ren ..\..\install\gdal-%VER%\bld release
rd c:\warmerda
popd

endlocal
