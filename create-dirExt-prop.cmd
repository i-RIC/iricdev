@echo off
setlocal
set topdir=%~dp0
set topdir=%topdir:\=/%
call versions.cmd
if "%CGNSLIB_VER%"=="3.2.1" (
  set CGNSLIB_VER=%CGNSLIB_VER%-patch1
)
@echo.[release]
if "%CGNS_ADF%"=="YES" (
  @echo.cgnslib  = %topdir%lib/install/cgnslib-adf-%CGNSLIB_VER%/release/bin/
) else (
  @echo.cgnslib  = %topdir%lib/install/cgnslib-%CGNSLIB_VER%/release/bin/
)
@echo.expat    = %topdir%lib/install/expat-%EXPAT_VER%/release/bin/
@echo.gdal     = %topdir%lib/install/gdal-%GDAL_VER%/release/bin/
@echo.geos     = %topdir%lib/install/geos-%GEOS_VER%/release/bin/
@echo.hdf5     = %topdir%lib/install/hdf5-%HDF5_VER%/release/bin/
if "%CGNS_ADF%"=="YES" (
  @echo.iriclib  = %topdir%lib/install/iriclib-adf-%IRICLIB_VER%/release/lib/
) else (
  @echo.iriclib  = %topdir%lib/install/iriclib-%IRICLIB_VER%/release/lib/
)
@echo.netcdf   = %topdir%lib/install/netcdf-%NETCDF_VER%/release/bin/
@echo.openssl  = %topdir%lib/install/openssl-%OPENSSL_VER%/release/bin/
@echo.proj     = %topdir%lib/install/proj-%PROJ_VER%/release/bin/
@echo.qwt      = %topdir%lib/install/Qwt-%QWT_VER%/lib/
@echo.shapelib = %topdir%lib/install/shapelib-%SHAPELIB_VER%/release/
@echo.szip     = %topdir%lib/install/hdf5-%HDF5_VER%/release/bin/
@echo.udunits  = %topdir%lib/install/udunits-%UDUNITS_VER%/release/bin/
@echo.vtk      = %topdir%lib/install/VTK-%VTK_VER%/release/bin/
@echo.yaml-cpp = %topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/release/bin
@echo.zlib     = %topdir%lib/install/hdf5-%HDF5_VER%/release/bin/
@echo.
@echo.[debug]
if "%CGNS_ADF%"=="YES" (
  @echo.cgnslib  = %topdir%lib/install/cgnslib-adf-%CGNSLIB_VER%/debug/bin/
) else (
  @echo.cgnslib  = %topdir%lib/install/cgnslib-%CGNSLIB_VER%/debug/bin/
)
@echo.expat    = %topdir%lib/install/expat-%EXPAT_VER%/debug/bin/
@echo.gdal     = %topdir%lib/install/gdal-%GDAL_VER%/debug/bin/
@echo.geos     = %topdir%lib/install/geos-%GEOS_VER%/debug/bin/
@echo.hdf5     = %topdir%lib/install/hdf5-%HDF5_VER%/debug/bin/
if "%CGNS_ADF%"=="YES" (
  @echo.iriclib  = %topdir%lib/install/iriclib-adf-%IRICLIB_VER%/debug/lib/
) else (
  @echo.iriclib  = %topdir%lib/install/iriclib-%IRICLIB_VER%/debug/lib/
)
@echo.netcdf   = %topdir%lib/install/netcdf-%NETCDF_VER%/debug/bin/
@echo.openssl  = %topdir%lib/install/openssl-%OPENSSL_VER%/debug/bin/
@echo.proj     = %topdir%lib/install/proj-%PROJ_VER%/release/bin/
@echo.qwt      = %topdir%lib/install/Qwt-%QWT_VER%/lib/
@echo.shapelib = %topdir%lib/install/shapelib-%SHAPELIB_VER%/debug/
@echo.szip     = %topdir%lib/install/hdf5-%HDF5_VER%/debug/bin/
@echo.udunits  = %topdir%lib/install/udunits-%UDUNITS_VER%/debug/bin/
if "%DEBUG_LEAKS%"=="YES" (
  @echo.vtk      = %topdir%lib/install/VTK-%VTK_VER%/debug-vtk-leaks/bin/
) else (
  @echo.vtk      = %topdir%lib/install/VTK-%VTK_VER%/debug/bin/
)
@echo.yaml-cpp = %topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/debug/bin
@echo.zlib     = %topdir%lib/install/hdf5-%HDF5_VER%/debug/bin/
