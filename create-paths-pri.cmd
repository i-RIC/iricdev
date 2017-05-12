@echo off
setlocal
set topdir=%~dp0
set topdir=%topdir:\=/%
call versions.cmd
@echo.CONFIG^(debug, debug^|release^) {
@echo.	# gdal
@echo.	LIBS += -L"%topdir%lib/src/gdal-%GDAL-VER%"
@echo.
@echo.	# vtk
@echo.	LIBS += -L"%topdir%lib/install/vtk-%VTK-VER%/debug/lib"
@echo.
@echo.	# cgnslib
@echo.	LIBS += -L"%topdir%lib/install/cgnslib-%CGNSLIB-VER%/debug/lib"
@echo.
@echo.	# iriclib
@echo.	LIBS += -L"$$PWD/iriclib/debug"
@echo.
@echo.	# Qwt
@echo.	LIBS += -L"%topdir%lib/install/qwt-%QWT-VER%/lib"
@echo.
@echo.	# proj.4
@echo.	LIBS += -L"%topdir%lib/install/proj-%PROJ-VER%/release/lib"
@echo.
@echo.	# shapefile
@echo.	LIBS += -L"%topdir%lib/install/shapelib-%SHAPELIB-VER%/debug"
@echo.
@echo.	# hdf5
@echo.	LIBS += -L"%topdir%lib/install/hdf5-%HDF5-VER%/debug/lib"
@echo.
@echo.	# netcdf
@echo.	LIBS += -L"%topdir%lib/install/netcdf-%NETCDF-VER%/debug/lib"
@echo.
@echo.	# geos
@echo.	LIBS += -L"%topdir%lib/install/geos-%GEOS-VER%/debug/lib"
@echo.
@echo.	# yaml-cpp
@echo.	LIBS += -L"%topdir%lib/install/yaml-cpp-%YAML-CPP-VER%/debug/lib"
@echo.}
@echo.else {
@echo.	# gdal
@echo.	LIBS += -L"%topdir%lib/install/gdal-%GDAL-VER%/release/lib"
@echo.
@echo.	# vtk
@echo.	LIBS += -L"%topdir%lib/install/vtk-%VTK-VER%/release/lib"
@echo.
@echo.	# cgnslib
@echo.	LIBS += -L"%topdir%lib/install/cgnslib-%CGNSLIB-VER%/release/lib"
@echo.
@echo.	# iriclib
@echo.	LIBS += -L"$$PWD/iriclib/release"
@echo.
@echo.	# Qwt
@echo.	LIBS += -L"%topdir%lib/install/qwt-%QWT-VER%/lib"
@echo.
@echo.	# proj.4
@echo.	LIBS += -L"%topdir%lib/install/proj-%PROJ-VER%/release/lib"
@echo.
@echo.	# shapefile
@echo.	LIBS += -L"%topdir%lib/install/shapelib-%SHAPELIB-VER%/release"
@echo.
@echo.	# hdf5
@echo.	LIBS += -L"%topdir%lib/install/hdf5-%HDF5-VER%/release/lib"
@echo.
@echo.	# netcdf
@echo.	LIBS += -L"%topdir%lib/install/netcdf-%NETCDF-VER%/release/lib"
@echo.
@echo.	# geos
@echo.	LIBS += -L"%topdir%lib/install/geos-%GEOS-VER%/release/lib"
@echo.
@echo.	# yaml-cpp
@echo.	LIBS += -L"%topdir%lib/install/yaml-cpp-%YAML-CPP-VER%/release/lib"
@echo.}
@echo.
@echo.INCLUDEPATH += .
@echo.
@echo.# gdal
@echo.INCLUDEPATH += "%topdir%lib/install/gdal-%GDAL-VER%/debug/include"
@echo.
@echo.# vtk
@echo.INCLUDEPATH += "%topdir%lib/install/vtk-%VTK-VER%/debug/include/vtk-6.1"
@echo.
@echo.# cgnslib
@echo.INCLUDEPATH += "%topdir%lib/install/cgnslib-%CGNSLIB-VER%/debug/include"
@echo.
@echo.# iriclib
@echo.INCLUDEPATH += "$$PWD/iriclib"
@echo.
@echo.# Qwt
@echo.INCLUDEPATH += "%topdir%lib/install/qwt-%QWT-VER%/include"
@echo.
@echo.# shapelib
@echo.INCLUDEPATH += "%topdir%lib/install/shapelib-%SHAPELIB-VER%/release"
@echo.
@echo.# proj.4
@echo.INCLUDEPATH += "%topdir%lib/install/proj-%PROJ-VER%/release/include"
@echo.
@echo.# netcdf
@echo.INCLUDEPATH += "%topdir%lib/install/netcdf-%NETCDF-VER%/release/include"
@echo.
@echo.# geos
@echo.INCLUDEPATH += "%topdir%lib/install/geos-%GEOS-VER%/release/include"
@echo.
@echo.# yaml-cpp
@echo.INCLUDEPATH += "%topdir%lib/install/yaml-cpp-%YAML-CPP-VER%/release/include"
@echo.
@echo.# boost
@echo.INCLUDEPATH += "%topdir%lib/src/boost-%BOOST-VER%"
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