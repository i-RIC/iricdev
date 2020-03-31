@echo off
REM
REM download.cmd
REM
REM requires wget available from http://gnuwin32.sourceforge.net/packages/wget.htm
REM
REM wget --no-check-certificate http://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe
REM wget --no-check-certificate https://my.visualstudio.com/Downloads?pid=1901
REM wget --no-check-certificate https://cmake.org/files/v3.8/cmake-3.8.0-win64-x64.msi
REM wget --no-check-certificate http://prdownloads.sourceforge.net/nsis/nsis-3.01-setup.exe
REM
setlocal enableextensions enabledelayedexpansion
call versions.cmd
msbuild /nologo /target:download iricdev.proj
endlocal
