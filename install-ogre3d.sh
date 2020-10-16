#!/bin/bash

sudo apt install -y \
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

git clone --depth 1 --branch v1.12.9 https://github.com/OGRECave/ogre.git
(
  cd ogre

  mkdir -p build
  cd build
  rm -rf ./*

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOGRE_BUILD_DEPENDENCIES=false \
    -DOGRE_BUILD_TOOLS=false \
    -DOGRE_INSTALL_TOOLS=false \
    -DOGRE_BUILD_SAMPLES=false \
    -DOGRE_CONFIG_ENABLE_ZIP=false

  make -j 8
  sudo make install
  sudo ldconfig
)

cat /usr/share/OGRE/plugins.cfg > plugins.cfg
