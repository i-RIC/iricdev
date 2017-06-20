## iricdev

Build libraries needed to build iRIC on Linux and Windows

## Windows Prerequisites:

* Visual Studio 2013 available from https://my.visualstudio.com/Downloads?pid=1901
* wget available from http://gnuwin32.sourceforge.net/packages/wget.htm
* cmake available from https://cmake.org/download/
* Qt 5.5 available from https://www.qt.io/download/
* 7-zip available from http://www.7-zip.org/
* NSIS available from http://nsis.sourceforge.net/Download/ (for HDF5 packaging)
* Add wget and 7-zip installation path to "Path" environment variable.

## Windows Build

    git clone https://github.com/scharlton2/iricdev.git iricdev_2013
    cd iricdev_2013
    download.cmd
    build_2013.cmd
    copy paths.pri [prepost-gui-root]\.
    copy dirExt.prop [prepost-gui-root]\tools\data\.
    mkdir [prepost-gui-root]\libdlls\debug.
    mkdir [prepost-gui-root]\libdlls\release.

## Linux Prerequisites:

* C compiler
* C++ compiler
* cmake (tested using cmake version 2.8.12.1)
* wget
* Qt 5.5 available from http://download.qt.io/archive/qt/5.5/5.5.1/qt-opensource-linux-x64-5.5.1.run

## Linux GCC Build (tested using gcc (GCC) 4.4.7 20120313)

    git clone https://github.com/scharlton2/iricdev.git iricdev_gcc
    cd iricdev_gcc
    ./download.sh
    ./build_gcc.sh

## Linux ICC Build (tested using icc (ICC) 17.0.2 20170213)

    git clone https://github.com/scharlton2/iricdev.git iricdev_icc
    cd iricdev_icc
    ./download.sh
    ./build_icc.sh
