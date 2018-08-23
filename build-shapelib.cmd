@echo off
setlocal enableextensions

call versions.cmd
set VER=%SHAPELIB_VER%

if exist lib\src\shapelib-%VER%     rd /s /q lib\src\shapelib-%VER%
if exist lib\build\shapelib-%VER%   rd /s /q lib\build\shapelib-%VER%
if exist lib\install\shapelib-%VER% rd /s /q lib\install\shapelib-%VER%

7z x shapelib-%VER%.zip -o"lib\src"

:: build and install release
pushd .
cd lib\src\shapelib-%VER%
nmake -f makefile.vc
mkdir ..\..\install\shapelib-%VER%\release
copy shapefil.h ..\..\install\shapelib-%VER%\release
copy *.exe ..\..\install\shapelib-%VER%\release
copy *.exp ..\..\install\shapelib-%VER%\release
copy *.dll ..\..\install\shapelib-%VER%\release
copy *.lib ..\..\install\shapelib-%VER%\release
popd

:: build and install debug
pushd .
cd lib\src\shapelib-%VER%
nmake -f makefile.vc clean
nmake -f makefile.vc CFLAGS="/nologo /Ox /MDd /DSHAPELIB_DLLEXPORT"
mkdir ..\..\install\shapelib-%VER%\debug
copy shapefil.h ..\..\install\shapelib-%VER%\debug
copy *.exe ..\..\install\shapelib-%VER%\debug
copy *.exp ..\..\install\shapelib-%VER%\debug
copy *.dll ..\..\install\shapelib-%VER%\debug
copy *.lib ..\..\install\shapelib-%VER%\debug
popd

endlocal
