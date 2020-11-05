# hello-ogre3d

Working sample how to prepare OGRE-based project.

### Environment

* Ubuntu 20
* OGRE 1.12 (build from source)
* Windows 10 FAILED (compilation OK, but can't run)

### Requirements

##### Ubuntu

```bash
bash ./install-ogre3d.sh
```

##### Windows

```bash
# git bash
bash ./install-ogre3d-win.sh
```

or

```bash
OGRE_SDK=$(realpath .)/ogre-sdk-v1.12.9-vc15-x64/
echo ${OGRE_SDK}
mkdir -p ${OGRE_SDK}

curl -L -o ogre-sdk-v1.12.9-vc15-x64.zip https://bintray.com/ogrecave/ogre/download_file?file_path=ogre-sdk-v1.12.9-vc15-x64.zip

7z x ogre-sdk-v1.12.9-vc15-x64.zip -o${OGRE_SDK}
setx OGRE_SDK ${OGRE_SDK}
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
