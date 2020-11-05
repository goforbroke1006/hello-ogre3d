#!/bin/bash

OGRE_SDK=C:/ogre-sdk-v1.12.9-vc15-x64/
rm -rf ${OGRE_SDK}
echo "Install to location: ${OGRE_SDK}"
mkdir -p ${OGRE_SDK}

curl -L -o ogre-sdk-v1.12.9-vc15-x64.zip https://bintray.com/ogrecave/ogre/download_file?file_path=ogre-sdk-v1.12.9-vc15-x64.zip

7z x ogre-sdk-v1.12.9-vc15-x64.zip -o${OGRE_SDK}
setx OGRE_SDK ${OGRE_SDK}

exit 0
