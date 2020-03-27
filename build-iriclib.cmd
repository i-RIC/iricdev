@echo off
setlocal enableextensions

call versions.cmd
msbuild /nologo /target:iriclib-build

endlocal
