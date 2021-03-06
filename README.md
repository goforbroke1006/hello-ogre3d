# hello-ogre3d

Working sample how to prepare OGRE-based project.

### Environment

* Ubuntu 20 / Windows 10 + MSVC 16 2019
* OGRE 1.12 (build from source)

### Requirements

##### Ubuntu

```bash
bash ./install-ogre3d.sh
```

##### Windows

* [Graphviz](https://graphviz.org/download/)
* [7 Zip](https://www.7-zip.org/download.html)

```bash
# git bash
bash build-ogre3d-debug-win.sh
```

### How to run

```bash
mkdir -p build
cd build
cmake ..
make
./hello-ogre3d
```

```bash
mkdir -p build
cd build
cmake -A win32 .. -G "Visual Studio 16 2019"
cmake --build .
./Debug/hello-ogre3d.exe
```

### Useful links

* https://ogrecave.github.io/ogre/api/1.12/setup.html
* https://github.com/sansajn/ogre-linux-starter/blob/master/hello.cpp
* https://help.ubuntu.ru/wiki/ogre


* http://wiki.ogre3d.org/Line+3D
