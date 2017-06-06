set(CTEST_PROJECT_NAME "iriclib")
set(CTEST_BUILD_NAME "$ENV{SGEN}-iriclib")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(CGNS_VER "$ENV{CGNSLIB_VER}")
set(HDF5_VER "$ENV{HDF5_VER}")

set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/iriclib")
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/build/iriclib")

#set(HDF_INC "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/include")

if (WIN32)
  if("${CONF_DIR}" STREQUAL "debug")
    set(HDF_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/hdf5_D.lib")
  else()
    set(HDF_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/hdf5.lib")
  endif()
endif()

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
  set(CGNS_INC "${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${CGNS_VER}/${CONF_DIR}/include")
  set(CGNS_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${CGNS_VER}/${CONF_DIR}/lib/libcgns.so")
  if("${CONF_DIR}" STREQUAL "debug")
    set(HDF_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libhdf5_debug.so")
    #set(SZIP_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libszip_debug.so")
    #set(ZLIB_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libz_debug.so")
  else()
    set(HDF_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libhdf5.so")
    #set(SZIP_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libszip.so")
    #set(ZLIB_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/libz.so")
  endif()
endif()


set(BUILD_OPTIONS 
-DCMAKE_INSTALL_PREFIX:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/iriclib/${CONF_DIR}
-DCGNS_LIBRARY:FILEPATH=${CGNS_LIB}
-DHDF5_LIBRARY:FILEPATH=${HDF_LIB}
)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
  list(APPEND BUILD_OPTIONS "-DCMAKE_C_FLAGS:STRING=-I${CGNS_INC}")
  list(APPEND BUILD_OPTIONS "-DCMAKE_CXX_FLAGS:STRING=-I${CGNS_INC}")
endif()

CTEST_START("Experimental")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET install)
