@echo off
setlocal enableextensions

set GENERATOR="Visual Studio 12 2013 Win64"
set SGEN="vs2013-x64"

call build_hdf5.cmd

endlocal
