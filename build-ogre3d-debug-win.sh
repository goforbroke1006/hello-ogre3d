#!/bin/bash

#git clone https://github.com/Microsoft/vcpkg.git
#cd vcpkg
#./bootstrap-vcpkg.sh
#./vcpkg integrate install
#./vcpkg.exe install assimp




OGRE_HOME="C:/OgreSDK"

#rm -rf ${OGRE_HOME}

if [[ ! -d ${OGRE_HOME} ]]; then
  git clone --depth 1 --branch v1.12.9 https://github.com/OGRECave/ogre.git ${OGRE_HOME}
fi

cd ${OGRE_HOME} || exit 1

(
  BUILD_TYPE=RelWithDebInfo
  BUILD_DIR=Build/${BUILD_TYPE}

  mkdir -p ${BUILD_DIR}
  cd ${BUILD_DIR} || exit 1

#  cmake                                       \
#    -DOGRE_INSTALL_SAMPLES_SOURCE:BOOL=TRUE   \
#    -DOGRE_INSTALL_DOCS:BOOL=TRUE             \
#    -DOGRE_INSTALL_DEPENDENCIES:BOOL=TRUE     \
#    -DCMAKE_BUILD_TYPE=${BUILD_TYPE}          \
#    -DOGRE_BUILD_PLUGIN_ASSIMP:BOOL=FALSE     \
#    -A x64                                  \
#    ../..

  cmake                                       \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE}          \
    -G "Visual Studio 16 2019" -A x64         \
    ../..

  cmake --build . --config ${BUILD_TYPE}
  cmake --install . --config ${BUILD_TYPE}

  setx OGRE_HOME ${OGRE_HOME}/${BUILD_DIR}/sdk
)

exit 0






OGRE_HOME="C:/OgreSDK"

#rm -rf ${OGRE_HOME}

if [[ ! -d ${OGRE_HOME} ]]; then
  git clone --depth 1 --branch v1.12.9 https://github.com/OGRECave/ogre.git ${OGRE_HOME}
fi

cd ${OGRE_HOME} || exit 1

(
  BUILD_TYPE=Debug
  BUILD_DIR=Build/${BUILD_TYPE}
  GENERATOR="Visual Studio 16 2019"

#  rm -rf ${BUILD_DIR}
#  mkdir -p ${BUILD_DIR}
#  cd ${BUILD_DIR} || exit 1
#
#  cmake \
#    -DOGRE_BUILD_DEPENDENCIES=ON          \
#    -DOGRE_INSTALL_DEPENDENCIES:BOOL=TRUE \
#    -G "${GENERATOR}" -A x64 \
#    ../..
#
#  cmake --build . --config ${BUILD_TYPE}
#  cmake --install . --config ${BUILD_TYPE}
#  cmake --build . --config ${BUILD_TYPE} --target INSTALL

  setx OGRE_HOME ${OGRE_HOME}/${BUILD_DIR}/sdk

  # hotfixes
  cp ${OGRE_HOME}/${BUILD_DIR}/lib/Debug/*.lib ${OGRE_HOME}/${BUILD_DIR}/sdk/lib/
  cp ${OGRE_HOME}/${BUILD_DIR}/bin/Debug/*.dll ${OGRE_HOME}/${BUILD_DIR}/sdk/bin/

#  cp ${OGRE_HOME}/build32/${BUILD_TYPE}/lib/Debug/* ${OGRE_HOME}/build32/${BUILD_TYPE}/sdk/lib/
#  cp ${OGRE_HOME}/build32/${BUILD_TYPE}/bin/debug/* ${OGRE_HOME}/build32/${BUILD_TYPE}/sdk/bin/
)




# 1. Install Python
# 2. Install 7-zip and add its installation dir (C:\Program Files (x86)\7-Zip) to %PATH%
# 3. https://www2.graphviz.org/Packages/stable/windows/10/msbuild/Release/Win32/ download, unzip, add to %PATH%

# cd C:\OgreSDK\SDK\Win32
# set VSCMD_DEBUG=3
# call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"
# set VCTargetsPath="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Microsoft\VC\v160"
# call C:\OgreSDK\SDK\Win32\buildsdk.bat vc10


# C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build
# run vcvars32.bat vcvars64.bat vcvarsall.bat vcvarsamd64_x86.bat

# C:\OgreSDK\SDK\Win32
# run buildsdk.bat


#(
#  mkdir -p build32
#  cd build32/ || exit 1
#
#  rm -rf ./*
#
#  cmake -DCMAKE_BUILD_TYPE=Debug -A win32 .. #-G "Visual Studio 16 2019"
#  cmake --build . --config Debug
#  cmake --install . --config Debug
#
#)


#(
#  cd ${OGRE_HOME}/SDK/Win32/ || exit 1
#  mkdir -p vc16
#  cd vc16 || exit 1
#
#  cmake                                           \
#    -DOGRE_INSTALL_SAMPLES_SOURCE:BOOL=TRUE       \
#    -DOGRE_INSTALL_DOCS:BOOL=TRUE                 \
#    -DOGRE_INSTALL_DEPENDENCIES:BOOL=TRUE         \
#    -DCMAKE_INSTALL_PREFIX:PATH=${OGRE_HOME}/SDK/Win32/vc16/SDK  \
#    -DCMAKE_BUILD_TYPE=Debug                      \
#     -A win32           \
#    ../../..
#
#    # -G "Visual Studio 16 2019"
#
#  cmake --build . --config Debug
#  cmake --install . --config Debug
#)

#echo "Please setup env var OGRE_HOME to '${OGRE_HOME}\build32\sdk' value and reload IDE"
#echo "Please setup env var OGRE_DIR to '${OGRE_HOME}\build32\sdk\CMake' value and reload IDE"

#(
#  mkdir -p build64
#  cd build64/
#  rm -rf ./*
#
#  cmake -DCMAKE_BUILD_TYPE=Release -A x64 .. -G "Visual Studio 16 2019"
#  cmake --build . --config Release
#  cmake --install . --config Release
#)

exit 0


set VSCMD_DEBUG=3
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64 8.1
buildsdk.bat vc11x64



# VCTargetsPath:




#  rm -rf build32/${BUILD_TYPE}
#  mkdir -p build32/${BUILD_TYPE}
#  cd build32/${BUILD_TYPE} || exit 1

#  cmake                                       \
#    -DOGRE_INSTALL_SAMPLES_SOURCE:BOOL=FALSE  \
#    -DOGRE_INSTALL_DOCS:BOOL=FALSE            \
#    -DOGRE_BUILD_DEPENDENCIES=ON              \
#    -DOGRE_INSTALL_DEPENDENCIES:BOOL=TRUE     \
#    -DCMAKE_BUILD_TYPE=${BUILD_TYPE}          \
#    -A x64                                    \
#    ../..

#  cmake -A x64 ../..

#  chmod +x "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"
#  "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"




#  chmod +x 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat'
#  export VSCMD_DEBUG=3
#  'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat' x64 8.1

#  cmake -DCMAKE_GENERATOR_PLATFORM=x64 -G "NMake Makefiles" -A x64 ${OGRE_HOME}