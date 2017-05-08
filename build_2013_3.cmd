@echo off
setlocal enableextensions

pushd .
call "C:\Qt\5.5\msvc2013_64\bin\qtenv2.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
popd

if exist lib\src\shapelib-1.3.0   rd /s /q lib\src\shapelib-1.3.0
if exist lib\build\shapelib-1.3.0 rd /s /q lib\build\shapelib-1.3.0

7z x shapelib-1.3.0.zip -o"lib\src"

# build and install release
pushd .
cd lib\src\shapelib-1.3.0
nmake -f makefile.vc
mkdir ..\..\install\shapelib-1.3.0\release
copy shapefil.h ..\..\install\shapelib-1.3.0\release
copy *.exe ..\..\install\shapelib-1.3.0\release
copy *.exp ..\..\install\shapelib-1.3.0\release
copy *.dll ..\..\install\shapelib-1.3.0\release
copy *.lib ..\..\install\shapelib-1.3.0\release
popd

# build and install debug
pushd .
cd lib\src\shapelib-1.3.0
nmake -f makefile.vc clean
nmake -f makefile.vc CFLAGS="/nologo /Ox /MDd /DSHAPELIB_DLLEXPORT"
mkdir ..\..\install\shapelib-1.3.0\debug
copy shapefil.h ..\..\install\shapelib-1.3.0\debug
copy *.exe ..\..\install\shapelib-1.3.0\debug
copy *.exp ..\..\install\shapelib-1.3.0\debug
copy *.dll ..\..\install\shapelib-1.3.0\debug
copy *.lib ..\..\install\shapelib-1.3.0\debug
popd

endlocal
