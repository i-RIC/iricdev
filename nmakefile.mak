# In a command prompt
#   load_qt.cmd 
#   versions.cmd
#   nmake -f nmakefile.mak

INSTALL_DIR = lib/install
SRC_DIR = lib/src

GENERATOR = Visual Studio 12 2013 Win64
SGEN = vs2013-x64

!IF "$(VERSIONS_CMD_RUN)" == ""
!ERROR *** Must run versions.cmd first ***
!ENDIF

all : vtk
	create-files.cmd

#
# vtk
#
VTK_INSTALL_DIR = $(INSTALL_DIR)/vtk-$(VTK_VER)

vtk : $(VTK_INSTALL_DIR)/debug $(VTK_INSTALL_DIR)/release $(VTK_INSTALL_DIR)/debug-vtk-leaks

$(VTK_INSTALL_DIR)/debug : $(SRC_DIR)/VTK-$(VTK_VER)
	ctest -S build-vtk.cmake -DCONF_DIR:STRING=debug           -DCTEST_CMAKE_GENERATOR:STRING="$(GENERATOR)" -C Debug   -VV -O $(SGEN)-vtk-debug.log

$(VTK_INSTALL_DIR)/release : $(SRC_DIR)/VTK-$(VTK_VER)
	ctest -S build-vtk.cmake -DCONF_DIR:STRING=release         -DCTEST_CMAKE_GENERATOR:STRING="$(GENERATOR)" -C Release -VV -O $(SGEN)-vtk-release.log

$(VTK_INSTALL_DIR)/debug-vtk-leaks : $(SRC_DIR)/VTK-$(VTK_VER)
	ctest -S build-vtk.cmake -DCONF_DIR:STRING=debug-vtk-leaks -DCTEST_CMAKE_GENERATOR:STRING="$(GENERATOR)" -C Debug   -VV -O $(SGEN)-vtk-debug-leaks.log

$(SRC_DIR)/VTK-$(VTK_VER) : VTK-$(VTK_VER).zip
	7z x VTK-$(VTK_VER).zip -o"lib\src"

VTK-$(VTK_VER).zip :
	C:\Program Files\Git\mingw64\bin\curl.exe --help
	echo "Must run ./download_windows_curl.sh in a git bash shell"
	exit 1

show-versions :
	@echo VTK_VER=$(VTK_VER)
	@echo HDF5_VER=$(HDF5_VER)
	@echo IRICLIB_VER=$(IRICLIB_VER)
	@echo SHAPELIB_VER=$(SHAPELIB_VER)
	@echo QWT_VER=$(QWT_VER)
	@echo GDAL_VER=$(GDAL_VER)
	@echo PROJ_VER=$(PROJ_VER)
	@echo NETCDF_VER=$(NETCDF_VER)
	@echo GEOS_VER=$(GEOS_VER)
	@echo BOOST_VER=$(BOOST_VER)
	@echo YAML_CPP_VER=$(YAML_CPP_VER)
	@echo BOOST_UVER=$(BOOST_UVER)
