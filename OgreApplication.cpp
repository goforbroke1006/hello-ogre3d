//
// Created by goforbroke on 15.10.2020.
//

#include "OgreApplication.h"

#include <OGRE/Bites/OgreCameraMan.h>

OgreApplication::OgreApplication() : OgreBites::ApplicationContext("OgreTutorialApp"){}

void OgreApplication::setup() {
    // do not forget to call the base first
    OgreBites::ApplicationContext::setup();

    // register for input events
    addInputListener(this);

    // get a pointer to the already created root
    Ogre::Root* root = getRoot();
    Ogre::SceneManager* scnMgr = root->createSceneManager();

    // register our scene with the RTSS
    Ogre::RTShader::ShaderGenerator* shadergen = Ogre::RTShader::ShaderGenerator::getSingletonPtr();
    shadergen->addSceneManager(scnMgr);

    // without light we would just get a black screen
    Ogre::Light* light = scnMgr->createLight("MainLight");
    Ogre::SceneNode* lightNode = scnMgr->getRootSceneNode()->createChildSceneNode();
    lightNode->setPosition(0, 10, 15);
    lightNode->attachObject(light);

    // also need to tell where we are
    mCameraNode = scnMgr->getRootSceneNode()->createChildSceneNode();
    mCameraNode->setPosition(0, 0, 15);
    mCameraNode->lookAt(Ogre::Vector3(0, 0, -1), Ogre::Node::TS_PARENT);


    // create the camera
    Ogre::Camera* cam = scnMgr->createCamera("myCam");
    cam->setNearClipDistance(5); // specific to this sample
    cam->setAutoAspectRatio(true);
    mCameraNode->attachObject(cam);

    // makes Camera orbit
//    auto mCameraMan = new OgreBites::CameraMan(*cam);
//    mCameraMan->setStyle(OgreBites::CS_ORBIT);
//    mCameraMan->setFixedYawAxis(true);

    // and tell it to render into the main window
    getRenderWindow()->addViewport(cam);

    // finally something to render
    Ogre::Entity* ent = scnMgr->createEntity("Sinbad.mesh");
    Ogre::SceneNode* node = scnMgr->getRootSceneNode()->createChildSceneNode();
    node->attachObject(ent);

    mCameraNode->setAutoTracking(true, node);
    mCameraNode->setFixedYawAxis(true);
    mCameraMan = new SdkCameraman(mCamera);
}

bool OgreApplication::keyPressed(const OgreBites::KeyboardEvent &evt) {
    if (evt.keysym.sym == OgreBites::SDLK_ESCAPE) {
        getRoot()->queueEndRendering();
    }
    return true;
}

bool OgreApplication::mouseMoved(const OgreBites::MouseMotionEvent &evt) {
    mCameraNode->in(evt, id);
    return InputListener::mouseMoved(evt);
}
