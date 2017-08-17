set(CTEST_PROJECT_NAME "qwt")
set(CTEST_BUILD_NAME "$ENV{SGEN}-qwt")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

# rewrite qwtconfig.pri QWT_INSTALL_PREFIX

FILE(RENAME
  ${CTEST_SCRIPT_DIRECTORY}/lib/src/qwt-${VER}/qwtconfig.pri
  ${CTEST_SCRIPT_DIRECTORY}/lib/src/qwt-${VER}/qwtconfig.pri.orig
)

FILE(STRINGS
  ${CTEST_SCRIPT_DIRECTORY}/lib/src/qwt-${VER}/qwtconfig.pri.orig
  lines
)

foreach(line IN LISTS lines)
  if (line)
    STRING(REGEX REPLACE
           "/usr/local/qwt-\\$\\$QWT_VERSION"
           "${CTEST_SCRIPT_DIRECTORY}/lib/install/qwt-${VER}"
           new_line ${line})
  else()
    set(new_line ${line})
  endif()
  file(APPEND
    ${CTEST_SCRIPT_DIRECTORY}/lib/src/qwt-${VER}/qwtconfig.pri
    "${new_line}\n"
  )
endforeach()
