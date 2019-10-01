@echo off
setlocal enableextensions

call create-paths-pri.cmd > paths.pri
call create-dirExt-prop.cmd > dirExt.prop

set DEBUG_LEAKS=YES

call create-paths-pri.cmd > paths-debug-vtk-leaks.pri
call create-dirExt-prop.cmd > dirExt-debug-vtk-leaks.prop

set CGNS_ADF=YES

call create-paths-pri.cmd > paths-adf.pri
call create-dirExt-prop.cmd > dirExt-adf.prop

endlocal
