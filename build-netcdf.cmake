set(CTEST_PROJECT_NAME "netcdf")
set(CTEST_BUILD_NAME "$ENV{SGEN}-netcdf")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(VER "$ENV{NETCDF_VER}")
set(HDF5_VER "$ENV{HDF5_VER}")
set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/netcdf-${VER}")
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/build/netcdf-${VER}")


if (WIN32)
  if("${CONF_DIR}" STREQUAL "debug")
    set(ZLIB_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/zlib_D.lib")
    set(SZIP_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/szip_D.lib")
  else()
    set(ZLIB_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/zlib.lib")
    set(SZIP_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/szip.lib")
  endif()
elseif("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
  if("${CONF_DIR}" STREQUAL "debug")
    set(ZLIB_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libz_debug.so.1.2")
    set(SZIP_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libszip_debug.so.2.1")
  else()
    set(ZLIB_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libz.so.1.2")
    set(SZIP_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libszip.so.2.1")
  endif()
endif()


set(BUILD_OPTIONS 
  -DCMAKE_INSTALL_PREFIX:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/netcdf-${VER}/${CONF_DIR}
  -DENABLE_DAP:BOOL=OFF
  -DENABLE_TESTS:BOOL=OFF
  -DHDF5_DIR:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/cmake/hdf5
  -DZLIB_INCLUDE_DIR:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/include
  -DZLIB_LIBRARY:PATH=${ZLIB_LIB}
  -DSZIP_LIBRARY:PATH=${SZIP_LIB}
  -DBUILD_UTILITIES:BOOL=OFF
  -DBUILD_TESTING:BOOL=OFF
  -DMSVC12_REDIST_DIR:PATH=C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/VC/redist
  -DCMAKE_LIBRARY_PATH:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib
)

CTEST_START("Experimental")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET install)
