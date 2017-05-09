@echo off
setlocal enableextensions

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
