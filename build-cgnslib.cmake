set(CTEST_PROJECT_NAME "cgns")
set(CTEST_BUILD_NAME "$ENV{SGEN}-cgns")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(VER "$ENV{CGNSLIB-VER}")
set(HDF5_VER "$ENV{HDF5-VER}")
set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/cgnslib-${VER}")
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/build/cgnslib-${VER}")

set(HDF_INC "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/include")
if("${CONF_DIR}" STREQUAL "debug")
  set(HDF_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/hdf5_D.lib")
else()
  set(HDF_LIB "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/${CONF_DIR}/lib/hdf5.lib")

  # HACK to force extract_subset.c to compile (fails w/ VS2013 Release build)
  if (WIN32)
    FILE(RENAME
      ${CTEST_SCRIPT_DIRECTORY}/lib/src/cgnslib-${VER}/src/cgnstools/utilities/extract_subset.c
      ${CTEST_SCRIPT_DIRECTORY}/lib/src/cgnslib-${VER}/src/cgnstools/utilities/extract_subset.c.orig
    )
    FILE(WRITE
      ${CTEST_SCRIPT_DIRECTORY}/lib/src/cgnslib-${VER}/src/cgnstools/utilities/extract_subset.c
      "int main(int argc, char *argv[]) { return 0; }\n"
    )
  endif()
endif()

set(BUILD_OPTIONS 
-DCMAKE_INSTALL_PREFIX:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${VER}/${CONF_DIR}
-DCGNS_BUILD_CGNSTOOLS:BOOL=$ENV{BUILD_TOOLS}
-DCGNS_ENABLE_FORTRAN:BOOL=ON
-DCGNS_ENABLE_HDF5:BOOL=ON
-DCGNS_ENABLE_LFS:BOOL=ON
-DHDF5_INCLUDE_PATH:PATH=${HDF_INC}
-DHDF5_LIBRARY:FILEPATH=${HDF_LIB}
-DHDF5_NEED_SZIP:BOOL=ON
-DHDF5_NEED_ZLIB:BOOL=ON
)

CTEST_START("Experimental")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
file(COPY "${CTEST_SCRIPT_DIRECTORY}/lib/build/cgnslib-${VER}/src/${CONF_DIR}/cgnsdll.dll" DESTINATION "${CTEST_SCRIPT_DIRECTORY}/lib/build/cgnslib-${VER}/src")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET INSTALL)

# fix comments for cgnslib_f.h

FILE(RENAME
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${VER}/${CONF_DIR}/include/cgnslib_f.h
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${VER}/${CONF_DIR}/include/cgnslib_f.h.orig
)

FILE(STRINGS
  ${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${VER}/${CONF_DIR}/include/cgnslib_f.h.orig
  lines
)

foreach(line IN LISTS lines)
  if (line)
    STRING(REGEX REPLACE "^c" "!c" new_line ${line})
  else()
    set(new_line ${line})
  endif()
  file(APPEND
    ${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${VER}/${CONF_DIR}/include/cgnslib_f.h
    "${new_line}\n"
  )
endforeach()

if("${CONF_DIR}" STREQUAL "release")
  if (WIN32)
    # restore original extract_subset.c
    FILE(REMOVE
      ${CTEST_SCRIPT_DIRECTORY}/lib/src/cgnslib-${VER}/src/cgnstools/utilities/extract_subset.c
    )
    FILE(RENAME
      ${CTEST_SCRIPT_DIRECTORY}/lib/src/cgnslib-${VER}/src/cgnstools/utilities/extract_subset.c.orig
      ${CTEST_SCRIPT_DIRECTORY}/lib/src/cgnslib-${VER}/src/cgnstools/utilities/extract_subset.c
    )
    # delete fake extract_subset.exe
    FILE(REMOVE
      ${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${VER}/${CONF_DIR}/bin/extract_subset.exe
    )
    # write note about extract-subset.exe
    FILE(WRITE
      ${CTEST_SCRIPT_DIRECTORY}/lib/install/cgnslib-${VER}/${CONF_DIR}/bin/extract_subset.exe.txt
      "${CTEST_SCRIPT_DIRECTORY}/lib/src/cgnslib-${VER}/src/cgnstools/utilities/extract_subset.c causes an internal compiler error in VS2013 Release. (see ${CTEST_SCRIPT_DIRECTORY}/build-cgnslib.cmake.\n"
    )
  endif()
endif()
