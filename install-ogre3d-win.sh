#!/bin/bash

#rm -rf C:/ogre/

if [[ ! -d C:/ogre/ ]]; then
  git clone --depth 1 --branch v1.12.9 https://github.com/OGRECave/ogre.git C:/ogre/
fi

set OGRE_HOME="C:/ogre/"

cd C:/ogre/

(
  mkdir -p build32
  cd build32/
  rm -rf ./*

  cmake -DCMAKE_BUILD_TYPE=Release -A win32 .. -G "Visual Studio 16 2019"
  cmake --build . --config Release
  cmake --install . --config Release
)

(
  mkdir -p build64
  cd build64/
  rm -rf ./*

  cmake -DCMAKE_BUILD_TYPE=Release -A x64 .. -G "Visual Studio 16 2019"
  cmake --build . --config Release
  cmake --install . --config Release
)

