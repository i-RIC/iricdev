@echo off
setlocal enableextensions

pushd .
call "C:\Qt\5.5\msvc2013_64\bin\qtenv2.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
popd

if exist lib\src\gdal-1.11.2     rd /s /q lib\src\gdal-1.11.2
if exist lib\build\gdal-1.11.2   rd /s /q lib\build\gdal-1.11.2
if exist lib\install\gdal-1.11.2 rd /s /q lib\install\gdal-1.11.2
if exist c:\warmerda             rd /s /q c:\warmerda

7z x gdal-1.11.2.tar.gz -so | 7z x -si -ttar -o"lib\src"

mkdir lib\install\gdal-1.11.2

pushd lib\src\gdal-1.11.2
mkdir c:\warmerda\bld
nmake -f makefile.vc DEBUG=1 WIN64=YES MSVC_VER=1800
nmake -f makefile.vc DEBUG=1 WIN64=YES MSVC_VER=1800 devinstall
move c:\warmerda\bld ..\..\install\gdal-1.11.2
ren ..\..\install\gdal-1.11.2\bld debug
rd c:\warmerda
popd

pushd lib\src\gdal-1.11.2
mkdir c:\warmerda\bld
nmake -f makefile.vc WIN64=YES MSVC_VER=1800 clean
nmake -f makefile.vc WIN64=YES MSVC_VER=1800
nmake -f makefile.vc WIN64=YES MSVC_VER=1800 devinstall
move c:\warmerda\bld ..\..\install\gdal-1.11.2
ren ..\..\install\gdal-1.11.2\bld release
rd c:\warmerda
popd

endlocal
