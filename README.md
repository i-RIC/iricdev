## iricdev

Build libraries needed to build iRIC on Windows

## Prerequisites:

* Visual Studio 2013 available from https://my.visualstudio.com/Downloads?pid=1901
* wget available from http://gnuwin32.sourceforge.net/packages/wget.htm
* cmake available from https://cmake.org/download/
* Qt 5.5 available from https://www.qt.io/download/
* 7-zip available from http://www.7-zip.org/
* NSIS available from http://nsis.sourceforge.net/Download/ (for HDF5 packaging)
* Add wget and 7-zip installation path to "Path" environment variable.
* Tcl available from https://www.activestate.com/activetcl/downloads (if building cgns and hdf5 tools)

## Build

    git clone https://github.com/scharlton2/iricdev.git iricdev_2013
    cd iricdev_2013
    download.cmd
    build_2013.cmd  (or build_2013_w_tools.cmd to build cgns and hdf5 tools)
    copy paths.pri [prepost-gui-root]\.
    copy dirExt.prop [prepost-gui-root]\tools\data\.
    create folder [prepost-gui-root]\libdlls\Debug.
    create folder [prepost-gui-root]\libdlls\Release.
    :: if building tools
    add install\cgnslib-[ver]\release\bin and install\hdf5-[ver]\release\bin to "Path"
    
