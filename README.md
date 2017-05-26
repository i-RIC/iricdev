## iricdev

Build libraries needed to build iRIC on Windows

## Prerequisites:

* Visual Studio 2013 available from https://my.visualstudio.com/Downloads?pid=1901
* wget available from http://gnuwin32.sourceforge.net/packages/wget.htm
* cmake available from https://cmake.org/download/
* Qt 5.5 available from https://www.qt.io/download/
* 7-zip available from http://www.7-zip.org/
* NSIS available from http://nsis.sourceforge.net/Download/ (for HDF5 packaging)

## Build

    git clone https://github.com/scharlton2/iricdev.git iricdev_2013
    cd iricdev_2013
    download.cmd
    build_2013.cmd
    copy paths.pri [prepost-gui-root]\.
    copy dirExt.prop [prepost-gui-root]\tools\data\.
