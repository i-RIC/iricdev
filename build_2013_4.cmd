@echo off
setlocal enableextensions

pushd .
call "C:\Qt\5.5\msvc2013_64\bin\qtenv2.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
popd

if exist lib\src\qwt-6.1.3   rd /s /q lib\src\qwt-6.1.3
if exist lib\build\qwt-6.1.3 rd /s /q lib\build\qwt-6.1.3

7z x qwt-6.1.3.zip -o"lib\src"

# build and install debug
pushd lib\src\qwt-6.1.3
qmake
nmake all
nmake install
move c:\Qwt-6.1.3 ..\..\install\
popd

endlocal
