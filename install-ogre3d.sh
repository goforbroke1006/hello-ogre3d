#!/bin/bash

# https://wiki.ogre3d.org/Prerequisites?tikiversion=Linux#Ubuntu
sudo apt-get install -y \
  build-essential automake libtool
sudo apt-get install -y \
  libfreetype6-dev libfreeimage-dev libzzip-dev libxrandr-dev libxaw7-dev \
  freeglut3-dev libgl1-mesa-dev libglu1-mesa-dev
sudo apt-get install -y \
  nvidia-cg-toolkit libois-dev libboost-thread-dev
sudo apt-get install -y \
  doxygen graphviz libcppunit-dev

sudo apt install -y \
  cmake \
  automake \
  build-essential \
  doxygen \
  freeglut3-dev \
  graphviz \
  libtool \
  libxaw7-dev \
  zlib1g-dev

sudo apt-get install -y libgles2-mesa-dev libxt-dev libxaw7-dev
sudo apt-get install -y nvidia-cg-toolkit libsdl2-dev doxygen

sudo apt-get install -y libzzip-dev
sudo apt-get install -y libpugixml-dev
sudo apt install -y libsdl2-dev

OGRE_SOURCE_DIR=~/ogre/

#rm -rf ogre/
git clone --depth 1 --branch v1.12.9 https://github.com/OGRECave/ogre.git ${OGRE_SOURCE_DIR}
(
  cd ${OGRE_SOURCE_DIR}

  mkdir -p build
  cd build
  rm -rf ./*

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr    \
    -DOGRE_BUILD_DEPENDENCIES=true \
    -DOGRE_BUILD_TOOLS=false       \
    -DOGRE_INSTALL_TOOLS=false     \
    -DOGRE_BUILD_SAMPLES=false     \
    -DOGRE_CONFIG_ENABLE_ZIP=false

  make -j 8
  sudo make install
  sudo ldconfig
)

cat /usr/share/OGRE/plugins.cfg > plugins.cfg
