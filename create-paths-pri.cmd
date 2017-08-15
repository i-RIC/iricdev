@echo off
setlocal
set topdir=%~dp0
set topdir=%topdir:\=/%
call versions.cmd
@echo.CONFIG^(debug, debug^|release^) {
@echo.	# gdal
@echo.	LIBS += -L"%topdir%lib/src/gdal-%GDAL_VER%/debug/lib"
@echo.
@echo.	# vtk
@echo.	LIBS += -L"%topdir%lib/install/vtk-%VTK_VER%/debug/lib"
@echo.
@echo.	# cgnslib
@echo.	LIBS += -L"%topdir%lib/install/cgnslib-%CGNSLIB_VER%/debug/lib"
@echo.
@echo.	# iriclib
@echo.	LIBS += -L"%topdir%lib/install/iriclib-%IRICLIB_VER:~0,7%/debug/lib"
@echo.
@echo.	# Qwt
@echo.	LIBS += -L"%topdir%lib/install/qwt-%QWT_VER%/lib"
@echo.
@echo.	# proj.4
@echo.	LIBS += -L"%topdir%lib/install/proj-%PROJ_VER%/release/lib"
@echo.
@echo.	# shapefile
@echo.	LIBS += -L"%topdir%lib/install/shapelib-%SHAPELIB_VER%/debug"
@echo.
@echo.	# hdf5
@echo.	LIBS += -L"%topdir%lib/install/hdf5-%HDF5_VER%/debug/lib"
@echo.
@echo.	# netcdf
@echo.	LIBS += -L"%topdir%lib/install/netcdf-%NETCDF_VER%/debug/lib"
@echo.
@echo.	# geos
@echo.	LIBS += -L"%topdir%lib/install/geos-%GEOS_VER%/debug/lib"
@echo.
@echo.	# yaml-cpp
@echo.	LIBS += -L"%topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/debug/lib"
@echo.}
@echo.else {
@echo.	# gdal
@echo.	LIBS += -L"%topdir%lib/install/gdal-%GDAL_VER%/release/lib"
@echo.
@echo.	# vtk
@echo.	LIBS += -L"%topdir%lib/install/vtk-%VTK_VER%/release/lib"
@echo.
@echo.	# cgnslib
@echo.	LIBS += -L"%topdir%lib/install/cgnslib-%CGNSLIB_VER%/release/lib"
@echo.
@echo.	# iriclib
@echo.	LIBS += -L"%topdir%lib/install/iriclib-%IRICLIB_VER:~0,7%/release/lib"
@echo.
@echo.	# Qwt
@echo.	LIBS += -L"%topdir%lib/install/qwt-%QWT_VER%/lib"
@echo.
@echo.	# proj.4
@echo.	LIBS += -L"%topdir%lib/install/proj-%PROJ_VER%/release/lib"
@echo.
@echo.	# shapefile
@echo.	LIBS += -L"%topdir%lib/install/shapelib-%SHAPELIB_VER%/release"
@echo.
@echo.	# hdf5
@echo.	LIBS += -L"%topdir%lib/install/hdf5-%HDF5_VER%/release/lib"
@echo.
@echo.	# netcdf
@echo.	LIBS += -L"%topdir%lib/install/netcdf-%NETCDF_VER%/release/lib"
@echo.
@echo.	# geos
@echo.	LIBS += -L"%topdir%lib/install/geos-%GEOS_VER%/release/lib"
@echo.
@echo.	# yaml-cpp
@echo.	LIBS += -L"%topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/release/lib"
@echo.}
@echo.
@echo.INCLUDEPATH += .
@echo.
@echo.# gdal
@echo.INCLUDEPATH += "%topdir%lib/install/gdal-%GDAL_VER%/debug/include"
@echo.
@echo.# vtk
@echo.INCLUDEPATH += "%topdir%lib/install/vtk-%VTK_VER%/debug/include/vtk-6.1"
@echo.
@echo.# cgnslib
@echo.INCLUDEPATH += "%topdir%lib/install/cgnslib-%CGNSLIB_VER%/debug/include"
@echo.
@echo.# iriclib
@echo.INCLUDEPATH += "%topdir%lib/install/iriclib-%IRICLIB_VER:~0,7%/release/include"
@echo.
@echo.# Qwt
@echo.INCLUDEPATH += "%topdir%lib/install/qwt-%QWT_VER%/include"
@echo.
@echo.# shapelib
@echo.INCLUDEPATH += "%topdir%lib/install/shapelib-%SHAPELIB_VER%/release"
@echo.
@echo.# proj.4
@echo.INCLUDEPATH += "%topdir%lib/install/proj-%PROJ_VER%/release/include"
@echo.
@echo.# netcdf
@echo.INCLUDEPATH += "%topdir%lib/install/netcdf-%NETCDF_VER%/release/include"
@echo.
@echo.# geos
@echo.INCLUDEPATH += "%topdir%lib/install/geos-%GEOS_VER%/release/include"
@echo.
@echo.# yaml-cpp
@echo.INCLUDEPATH += "%topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/release/include"
@echo.
@echo.# boost
@echo.INCLUDEPATH += "%topdir%lib/src/boost-%BOOST_VER%"
@echo.
@echo.#internal libs
@echo.INCLUDEPATH += "$$PWD/libs"
@echo.
@echo.CONFIG += c++11
@echo.
@echo.target.path = /usr/local/iRIC
@echo.INSTALLS += target
@echo.
endlocal
