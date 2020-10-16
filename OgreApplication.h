//
// Created by goforbroke on 15.10.2020.
//

#ifndef HELLO_OGRE3D_OGREAPPLICATION_H
#define HELLO_OGRE3D_OGREAPPLICATION_H

#include <OGRE/Ogre.h>
#include <OGRE/Bites/OgreApplicationContext.h>

class OgreApplication : public OgreBites::ApplicationContext, public OgreBites::InputListener {
public:
    OgreApplication();
    void setup() override;

    bool keyPressed(const OgreBites::KeyboardEvent& evt) override;
};


#endif //HELLO_OGRE3D_OGREAPPLICATION_H
