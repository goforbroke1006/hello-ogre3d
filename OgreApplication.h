//
// Created by goforbroke on 15.10.2020.
//

#ifndef HELLO_OGRE3D_OGREAPPLICATION_H
#define HELLO_OGRE3D_OGREAPPLICATION_H

//#include <OGRE/Ogre.h>
#include <OGRE/OgreRoot.h>
#include <OGRE/OgreRenderWindow.h>
#include <OGRE/OgreEntity.h>
#include <OGRE/OgreMovableObject.h>
#include <OGRE/Bites/OgreApplicationContext.h>
#include <OGRE/Bites/OgreInput.h>
#include <OGRE/OgreSceneNode.h>
#include <OGRE/Bites/OgreCameraMan.h>

class OgreApplication
        : public OgreBites::ApplicationContext,
          public OgreBites::InputListener {
public:
    OgreApplication();

    void setup() override;

    void frameRendered(const Ogre::FrameEvent &evt) override;

    bool keyPressed(const OgreBites::KeyboardEvent &evt) override;

    bool mouseMoved(const OgreBites::MouseMotionEvent &evt) override;
};


#endif //HELLO_OGRE3D_OGREAPPLICATION_H
