@echo off
setlocal enableextensions

call create-paths-pri.cmd > paths.pri
call create-dirExt-prop.cmd > dirExt.prop

endlocal
