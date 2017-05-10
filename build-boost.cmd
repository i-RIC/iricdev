@echo off
setlocal enableextensions

call versions.cmd
set VER=%BOOST-VER%
set UVER=%BOOST_UVER%

if exist lib\src\boost_%UVER% rd /s /q lib\src\boost_%UVER%
if exist lib\src\boost-%VER%  rd /s /q lib\src\boost-%VER%

7z x boost_%UVER%.7z -o"lib\src"
ren lib\src\boost_%UVER% boost-%VER%

endlocal
