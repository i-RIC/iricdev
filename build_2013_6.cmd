@echo off
setlocal enableextensions

pushd .
call "C:\Qt\5.5\msvc2013_64\bin\qtenv2.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
popd

if exist lib\src\proj-4.8.0     rd /s /q lib\src\proj-4.8.0
if exist lib\build\proj-4.8.0   rd /s /q lib\build\proj-4.8.0
if exist lib\install\proj-4.8.0 rd /s /q lib\install\proj-4.8.0

7z x proj-4.8.0.zip -o"lib\src"

set topdir=%~dp0

pushd lib\src\proj-4.8.0
nmake -f makefile.vc INSTDIR=%topdir%\lib\install\proj-4.8.0\release
nmake -f makefile.vc INSTDIR=%topdir%\lib\install\proj-4.8.0\release install-all
popd

endlocal
