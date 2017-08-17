#!/bin/sh

if [ -x "${GENERATOR}" ]; then
  echo "No Generator has been set"
  exit 1
fi

. ./versions.sh
VER=${YAML_CPP_VER}

rm -rf lib/src/yaml-cpp-release-${VER}
rm -rf lib/src/yaml-cpp-${VER}
rm -rf lib/build/yaml-cpp-${VER}
rm -rf lib/install/yaml-cpp-${VER}

mkdir -p lib/src
cd lib/src
tar xvzf ../../yaml-cpp-release-0.5.2.tar.gz
mv yaml-cpp-release-${VER} yaml-cpp-${VER}
cd ../..

ctest -S build-yaml-cpp.cmake -DCONF_DIR:STRING=debug   "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Debug   -VV -O ${SGEN}-yaml-cpp-debug.log
ctest -S build-yaml-cpp.cmake -DCONF_DIR:STRING=release "-DCTEST_CMAKE_GENERATOR:STRING=${GENERATOR}" -C Release -VV -O ${SGEN}-yaml-cpp-release.log
