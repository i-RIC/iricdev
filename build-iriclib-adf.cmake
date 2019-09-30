set(CTEST_PROJECT_NAME "iriclib")
set(CTEST_BUILD_NAME "$ENV{SGEN}-iriclib")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(VER "$ENV{IRICLIB_ADF_VER}")
string(SUBSTRING ${VER} 0 7 SVER)
set(CGNS_VER "$ENV{CGNSLIB_VER}")
#set(HDF5_VER "$ENV{HDF5_VER}")
if(WIN32 AND ${CGNS_VER} STREQUAL "3.2.1")
  set(CGNS_VER "$ENV{CGNSLIB_VER}-patch1")
endif()

set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/iriclib-adf-${SVER}")
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/build/iriclib-adf-${SVER}/${CONF_DIR}")

# build PREFIX_PATH (Note the escaped semicolon)
#if (WIN32)
#  set(PREFIX_PATH "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/cmake/hdf5")
#else()
#  set(PREFIX_PATH "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/share/cmake/hdf5")
#endif()
# set(PREFIX_PATH "${PREFIX_PATH}\;${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${CGNS_VER}/${CONF_DIR}")
set(PREFIX_PATH "${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-adf-${CGNS_VER}/${CONF_DIR}")

# override LIBDIR to be consistent w/ hdf5 and cgns
set(BUILD_OPTIONS 
"-DCMAKE_INSTALL_PREFIX:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/iriclib-adf-${SVER}/${CONF_DIR}"
"-DCMAKE_PREFIX_PATH:PATH=${PREFIX_PATH}"
"-DCMAKE_INSTALL_LIBDIR:PATH=lib"
)

CTEST_START("Experimental")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
if (WIN32)
  file(COPY "${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-adf-${CGNS_VER}/${CONF_DIR}/bin/cgnsdll.dll"
       DESTINATION "${CTEST_BINARY_DIRECTORY}/unittests_cgnsfile/${CONF_DIR}"
       )
#  if(${CONF_DIR} STREQUAL "debug")
#    file(COPY "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/bin/hdf5_D.dll"
#         DESTINATION "${CTEST_BINARY_DIRECTORY}/unittests_cgnsfile/${CONF_DIR}"
#         )
#    file(COPY "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/bin/szip_D.dll"
#         DESTINATION "${CTEST_BINARY_DIRECTORY}/unittests_cgnsfile/${CONF_DIR}"
#         )
#    file(COPY "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/bin/zlib_D.dll"
#         DESTINATION "${CTEST_BINARY_DIRECTORY}/unittests_cgnsfile/${CONF_DIR}"
#         )
#  else()
#    file(COPY "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/bin/hdf5.dll"
#         DESTINATION "${CTEST_BINARY_DIRECTORY}/unittests_cgnsfile/${CONF_DIR}"
#         )
#    file(COPY "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/bin/szip.dll"
#         DESTINATION "${CTEST_BINARY_DIRECTORY}/unittests_cgnsfile/${CONF_DIR}"
#         )
#    file(COPY "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/bin/zlib.dll"
#         DESTINATION "${CTEST_BINARY_DIRECTORY}/unittests_cgnsfile/${CONF_DIR}"
#         )
#  endif()
endif()
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET RUN_TESTS)
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET install)
