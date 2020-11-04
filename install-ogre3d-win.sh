#!/bin/bash

OGRE_HOME="C:/OgreSDK"

#rm -rf ${OGRE_HOME}

if [[ ! -d ${OGRE_HOME} ]]; then
  git clone --depth 1 --branch v1.12.9 https://github.com/OGRECave/ogre.git ${OGRE_HOME}
fi

cd ${OGRE_HOME} || exit 1

(
  mkdir -p build32
  cd build32/ || exit 1

  rm -rf ./*

  cmake -DCMAKE_BUILD_TYPE=Release -A win32 .. #-G "Visual Studio 16 2019"
  cmake --build . --config Release
  cmake --install . --config Release

)

echo "Please setup env var OGRE_HOME to 'C:\OgreSDK\build32\sdk' value and reload IDE"
echo "Please setup env var OGRE_DIR to 'C:\OgreSDK\build32\sdk\CMake' value and reload IDE"

#(
#  mkdir -p build64
#  cd build64/
#  rm -rf ./*
#
#  cmake -DCMAKE_BUILD_TYPE=Release -A x64 .. -G "Visual Studio 16 2019"
#  cmake --build . --config Release
#  cmake --install . --config Release
#)

