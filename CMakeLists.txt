cmake_minimum_required(VERSION 3.0)
project(hello-ogre3d)

set(CMAKE_CXX_STANDARD 14)

add_executable(${PROJECT_NAME} main.cpp OgreApplication.cpp)
#target_link_libraries(${PROJECT_NAME} zzip)

if (WIN32)
    message("OGRE_HOME = " $ENV{OGRE_HOME})

    set(OGRE_DIR $ENV{OGRE_HOME}/CMake/)
    find_package(OGRE 1.12 REQUIRED COMPONENTS Bites RTShaderSystem)
    #file(GLOB OGRE_BINARY_FILES "$ENV{OGRE_HOME}/bin/*")
    #file(COPY ${OGRE_BINARY_FILES} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
    include_directories($ENV{OGRE_HOME}/include/)
    include_directories($ENV{OGRE_HOME}/include/OGRE/)
    include_directories($ENV{OGRE_HOME}/include/OGRE/RTShaderSystem)

    target_link_libraries(${PROJECT_NAME} OgreMain OgreBites OgreRTShaderSystem)

elseif (CYGWIN)

    set(OGRE_DIR /cygdrive/c/ogre/build64/sdk/CMake/)

    find_package(OGRE 1.12 REQUIRED COMPONENTS Bites RTShaderSystem)

    include_directories(/cygdrive/c/ogre/build64/sdk/include/)
    include_directories(/cygdrive/c/ogre/build64/sdk/include/OGRE/)
    include_directories(/cygdrive/c/ogre/build64/sdk/include/OGRE/RTShaderSystem)

    # this also sets the includes and pulls third party dependencies
    target_link_libraries(${PROJECT_NAME} OgreBites OgreRTShaderSystem)

else ()
    find_package(OGRE 1.12 REQUIRED COMPONENTS Bites RTShaderSystem)
    # this also sets the includes and pulls third party dependencies
    target_link_libraries(${PROJECT_NAME} OgreBites OgreRTShaderSystem)
endif ()

# specify which version and components you need
#find_package(OGRE 1.12 REQUIRED COMPONENTS Bites RTShaderSystem)

# copy resource.cfg next to our binaries where OGRE looks for it
file(COPY ./resources.cfg DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
file(COPY ./plugins.cfg DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
file(COPY ./media DESTINATION ${CMAKE_CURRENT_BINARY_DIR})


