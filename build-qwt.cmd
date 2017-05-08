@echo off
setlocal enableextensions

pushd .
call "C:\Qt\5.5\msvc2013_64\bin\qtenv2.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
popd

call versions.cmd
set VER=%QWT-VER%

if exist lib\src\qwt-%VER%     rd /s /q lib\src\qwt-%VER%
if exist lib\build\qwt-%VER%   rd /s /q lib\build\qwt-%VER%
if exist lib\install\qwt-%VER% rd /s /q lib\install\qwt-%VER%

7z x qwt-%VER%.zip -o"lib\src"

# build and install debug
pushd lib\src\qwt-%VER%
qmake
nmake all
nmake install
move c:\Qwt-%VER% ..\..\install\
popd

endlocal
