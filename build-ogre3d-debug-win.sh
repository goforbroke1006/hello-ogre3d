#!/bin/bash

OGRE_HOME="C:/OgreSDK"

#rm -rf ${OGRE_HOME}

if [[ ! -d ${OGRE_HOME} ]]; then
  git clone --depth 1 --branch v1.12.9 https://github.com/OGRECave/ogre.git ${OGRE_HOME}
fi

cd ${OGRE_HOME} || exit 1

#(
#  BUILD_TYPE=RelWithDebInfo
#  BUILD_DIR=Build/${BUILD_TYPE}
#
#  mkdir -p ${BUILD_DIR}
#  cd ${BUILD_DIR} || exit 1
#
#  cmake                                       \
#    -DCMAKE_BUILD_TYPE=${BUILD_TYPE}          \
#    -G "Visual Studio 16 2019" -A x64         \
#    ../..
#
#  cmake --build . --config ${BUILD_TYPE}
#  cmake --install . --config ${BUILD_TYPE}
#
#  setx OGRE_HOME ${OGRE_HOME}/${BUILD_DIR}/sdk
#)

(
  BUILD_TYPE=Debug
  BUILD_DIR=Build/${BUILD_TYPE}

  mkdir -p ${BUILD_DIR}
  cd ${BUILD_DIR} || exit 1

  cmake                                       \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE}          \
    -DOGRE_BUILD_PLUGIN_ASSIMP=OFF            \
    -G "Visual Studio 16 2019" -A x64         \
    ../..

  cmake --build . --config ${BUILD_TYPE}
  cmake --install . --config ${BUILD_TYPE}

  setx OGRE_HOME ${OGRE_HOME}/${BUILD_DIR}/sdk
)
