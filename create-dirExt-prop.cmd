@echo off
setlocal
set topdir=%~dp0
set topdir=%topdir:\=/%
call versions.cmd
@echo.[release]
@echo.cgnslib  = %topdir%lib/install/cgnslib-%CGNSLIB-VER%/release/bin/
@echo.gdal     = %topdir%lib/install/gdal-%GDAL-VER%/release/bin/
@echo.geos     = %topdir%lib/install/geos-%GEOS-VER%/release/bin/
@echo.hdf5     = %topdir%lib/install/hdf5-%HDF5-VER%/release/bin/
@echo.netcdf   = %topdir%lib/install/netcdf-%NETCDF-VER%/release/bin/
@echo.proj     = %topdir%lib/install/proj-%PROJ-VER%/release/bin/
@echo.qwt      = %topdir%lib/install/Qwt-%QWT-VER%/lib/
@echo.shapelib = %topdir%lib/install/shapelib-%SHAPELIB-VER%/release/
@echo.szip     = %topdir%lib/install/hdf5-%HDF5-VER%/release/bin/
@echo.vtk      = %topdir%lib/install/VTK-%VTK-VER%/release/bin/
@echo.yaml-cpp = %topdir%lib/install/yaml-cpp-%YAML-CPP-VER%/release/bin
@echo.zlib     = %topdir%lib/install/hdf5-%HDF5-VER%/release/bin/
@echo.
@echo.[debug]
@echo.cgnslib  = %topdir%lib/install/cgnslib-%CGNSLIB-VER%/debug/bin/
@echo.gdal     = %topdir%lib/install/gdal-%GDAL-VER%/debug/bin/
@echo.geos     = %topdir%lib/install/geos-%GEOS-VER%/debug/bin/
@echo.hdf5     = %topdir%lib/install/hdf5-%HDF5-VER%/debug/bin/
@echo.netcdf   = %topdir%lib/install/netcdf-%NETCDF-VER%/debug/bin/
@echo.proj     = %topdir%lib/install/proj-%PROJ-VER%/release/bin/
@echo.qwt      = %topdir%lib/install/Qwt-%QWT-VER%/lib/
@echo.shapelib = %topdir%lib/install/shapelib-%SHAPELIB-VER%/debug/
@echo.szip     = %topdir%lib/install/hdf5-%HDF5-VER%/debug/bin/
@echo.vtk      = %topdir%lib/install/VTK-%VTK-VER%/debug/bin/
@echo.yaml-cpp = %topdir%lib/install/yaml-cpp-%YAML-CPP-VER%/debug/bin
@echo.zlib     = %topdir%lib/install/hdf5-%HDF5-VER%/debug/bin/
