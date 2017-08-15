@echo off
setlocal
set topdir=%~dp0
set topdir=%topdir:\=/%
call versions.cmd
@echo.[release]
@echo.cgnslib  = %topdir%lib/install/cgnslib-%CGNSLIB_VER%/release/bin/
@echo.gdal     = %topdir%lib/install/gdal-%GDAL_VER%/release/bin/
@echo.geos     = %topdir%lib/install/geos-%GEOS_VER%/release/bin/
@echo.hdf5     = %topdir%lib/install/hdf5-%HDF5_VER%/release/bin/
@echo.iriclib  = %topdir%lib/install/iriclib-%IRICLIB_VER:~0,7%/release/lib/
@echo.netcdf   = %topdir%lib/install/netcdf-%NETCDF_VER%/release/bin/
@echo.proj     = %topdir%lib/install/proj-%PROJ_VER%/release/bin/
@echo.qwt      = %topdir%lib/install/Qwt-%QWT_VER%/lib/
@echo.shapelib = %topdir%lib/install/shapelib-%SHAPELIB_VER%/release/
@echo.szip     = %topdir%lib/install/hdf5-%HDF5_VER%/release/bin/
@echo.vtk      = %topdir%lib/install/VTK-%VTK_VER%/release/bin/
@echo.yaml-cpp = %topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/release/bin
@echo.zlib     = %topdir%lib/install/hdf5-%HDF5_VER%/release/bin/
@echo.
@echo.[debug]
@echo.cgnslib  = %topdir%lib/install/cgnslib-%CGNSLIB_VER%/debug/bin/
@echo.gdal     = %topdir%lib/install/gdal-%GDAL_VER%/debug/bin/
@echo.geos     = %topdir%lib/install/geos-%GEOS_VER%/debug/bin/
@echo.hdf5     = %topdir%lib/install/hdf5-%HDF5_VER%/debug/bin/
@echo.iriclib  = %topdir%lib/install/iriclib-%IRICLIB_VER:~0,7%/debug/lib/
@echo.netcdf   = %topdir%lib/install/netcdf-%NETCDF_VER%/debug/bin/
@echo.proj     = %topdir%lib/install/proj-%PROJ_VER%/release/bin/
@echo.qwt      = %topdir%lib/install/Qwt-%QWT_VER%/lib/
@echo.shapelib = %topdir%lib/install/shapelib-%SHAPELIB_VER%/debug/
@echo.szip     = %topdir%lib/install/hdf5-%HDF5_VER%/debug/bin/
@echo.vtk      = %topdir%lib/install/VTK-%VTK_VER%/debug/bin/
@echo.yaml-cpp = %topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/debug/bin
@echo.zlib     = %topdir%lib/install/hdf5-%HDF5_VER%/debug/bin/
