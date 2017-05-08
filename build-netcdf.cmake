set(CTEST_PROJECT_NAME "netcdf")
set(CTEST_BUILD_NAME "$ENV{SGEN}-netcdf")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/netcdf-4.3.3")
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/build/netcdf-4.3.3")

if("${CONF_DIR}" STREQUAL "debug")
  set(ZLIB_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/ZLib/${CONF_DIR}/lib/zlib_D.lib")
  set(SZIP_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/SZip/${CONF_DIR}/lib/szip_D.lib")
else()
  set(ZLIB_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/ZLib/${CONF_DIR}/lib/zlib.lib")
  set(SZIP_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/SZip/${CONF_DIR}/lib/szip.lib")
endif()

set(BUILD_OPTIONS 
  -DCMAKE_INSTALL_PREFIX:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/netcdf-4.3.3/${CONF_DIR}
  -DENABLE_DAP:BOOL=OFF
  -DENABLE_TESTS:BOOL=OFF
  -DHDF5_DIR:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/cmake/hdf5
  -DZLIB_INCLUDE_DIR:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/ZLib/${CONF_DIR}/include
  -DZLIB_LIBRARY:PATH=${ZLIB_LIB}
  -DSZIP_LIBRARY:PATH=${SZIP_LIB}
  -DBUILD_UTILITIES:BOOL=OFF
  -DBUILD_TESTING:BOOL=OFF
  -DMSVC12_REDIST_DIR:PATH=C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/VC/redist
)

#
# The hdf5-targets-${CONF_DIR}.cmake file contains this line:
# IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "zlib;szip"
# which adds zlib.lib and szip.lib without a path in the
# netcdf project. Here we remove the "zlib;szip" for the 
# configure
#

FILE(RENAME
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/cmake/hdf5/hdf5-targets-${CONF_DIR}.cmake
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/cmake/hdf5/hdf5-targets-${CONF_DIR}.cmake.orig
)

FILE(READ
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/cmake/hdf5/hdf5-targets-${CONF_DIR}.cmake.orig
  contents
)

STRING(REGEX REPLACE "zlib*szip" "" new_contents ${contents})

FILE(WRITE
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/cmake/hdf5/hdf5-targets-${CONF_DIR}.cmake
  ${new_contents}
)

CTEST_START("Experimental")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET INSTALL)

FILE(REMOVE
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/cmake/hdf5/hdf5-targets-${CONF_DIR}.cmake
)

FILE(RENAME
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/cmake/hdf5/hdf5-targets-${CONF_DIR}.cmake.orig
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/cmake/hdf5/hdf5-targets-${CONF_DIR}.cmake
)
