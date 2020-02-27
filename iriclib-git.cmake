set(CTEST_PROJECT_NAME "iriclib-git")
set(CTEST_BUILD_NAME "$ENV{SGEN}-iriclib-git")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(CGNS_VER "$ENV{CGNSLIB_VER}")
set(HDF5_VER "$ENV{HDF5_VER}")
if(${CGNS_VER} STREQUAL "3.2.1")
  set(CGNS_VER "$ENV{CGNSLIB_VER}-patch1")
endif()

set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/iriclib-git")
# avoid caching hdf5 settings
if(${CONF_DIR} STREQUAL "debug")
  set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/iriclib-git/_build_debug")
else()
  set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/iriclib-git/_build_release")
endif()

# build PREFIX_PATH (Note the escaped semicolon)
if (WIN32)
  set(PREFIX_PATH "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/cmake/hdf5")
else()
  set(PREFIX_PATH "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/share/cmake/hdf5")
endif()
set(PREFIX_PATH "${PREFIX_PATH}\;${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${CGNS_VER}/${CONF_DIR}")

# override LIBDIR to be consistent w/ hdf5 and cgns
set(BUILD_OPTIONS 
"-DCMAKE_INSTALL_PREFIX:PATH=${CTEST_BINARY_DIRECTORY}/INSTALL"
"-DCMAKE_PREFIX_PATH:PATH=${PREFIX_PATH}"
"-DCMAKE_INSTALL_LIBDIR:PATH=lib"
)

CTEST_START("Experimental")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
if (WIN32)
  set(cgns_dir "${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${CGNS_VER}/${CONF_DIR}")
  set(hdf5_dir "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}")
  set(unit_dir "${CTEST_BINARY_DIRECTORY}/unittests_cgnsfile/${CONF_DIR}")
  set(lock_dir "${CTEST_BINARY_DIRECTORY}/unittest_lock/${CONF_DIR}")
  set(mdfy_dir "${CTEST_BINARY_DIRECTORY}/unittest_cg_open_modify/${CONF_DIR}")
  set(read_dir "${CTEST_BINARY_DIRECTORY}/unittest_cg_open_read/${CONF_DIR}")
  # unittests_cgnsfile
  file(COPY "${cgns_dir}/bin/cgnsdll.dll"
       DESTINATION ${unit_dir}
       )
  # unittest_lock
  file(COPY "${cgns_dir}/bin/cgnsdll.dll"
       DESTINATION ${lock_dir}
       )
  # unittest_cg_open_modify
  file(COPY "${cgns_dir}/bin/cgnsdll.dll"
       DESTINATION ${mdfy_dir}
       )
  # unittest_cg_open_read
  file(COPY "${cgns_dir}/bin/cgnsdll.dll"
       DESTINATION ${read_dir}
       )
       
  if(${CONF_DIR} STREQUAL "debug")
    # unittests_cgnsfile
    file(INSTALL "${hdf5_dir}/bin/hdf5_D.dll" "${hdf5_dir}/bin/szip_D.dll" "${hdf5_dir}/bin/zlib_D.dll"
         DESTINATION ${unit_dir}
         )
    # unittest_lock
    file(INSTALL "${hdf5_dir}/bin/hdf5_D.dll" "${hdf5_dir}/bin/szip_D.dll" "${hdf5_dir}/bin/zlib_D.dll"
         DESTINATION ${lock_dir}
         )
    # unittest_cg_open_modify
    file(INSTALL "${hdf5_dir}/bin/hdf5_D.dll" "${hdf5_dir}/bin/szip_D.dll" "${hdf5_dir}/bin/zlib_D.dll"
         DESTINATION ${mdfy_dir}
         )
    # unittest_cg_open_read
    file(INSTALL "${hdf5_dir}/bin/hdf5_D.dll" "${hdf5_dir}/bin/szip_D.dll" "${hdf5_dir}/bin/zlib_D.dll"
         DESTINATION ${read_dir}
         )

  else()
    # unittests_cgnsfile
    file(INSTALL "${hdf5_dir}/bin/hdf5.dll" "${hdf5_dir}/bin/szip.dll" "${hdf5_dir}/bin/zlib.dll"
         DESTINATION ${unit_dir}
         )
    # unittest_lock
    file(INSTALL "${hdf5_dir}/bin/hdf5.dll" "${hdf5_dir}/bin/szip.dll" "${hdf5_dir}/bin/zlib.dll"
         DESTINATION ${unit_dir}
         )
    # unittest_cg_open_modify
    file(INSTALL "${hdf5_dir}/bin/hdf5.dll" "${hdf5_dir}/bin/szip.dll" "${hdf5_dir}/bin/zlib.dll"
         DESTINATION ${mdfy_dir}
         )
    # unittest_cg_open_read
    file(INSTALL "${hdf5_dir}/bin/hdf5.dll" "${hdf5_dir}/bin/szip.dll" "${hdf5_dir}/bin/zlib.dll"
         DESTINATION ${read_dir}
         )
  endif()
endif()
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET RUN_TESTS)
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET install)
