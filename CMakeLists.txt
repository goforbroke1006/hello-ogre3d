cmake_minimum_required(VERSION 3.0)
project(hello-ogre3d)

set(CMAKE_CXX_STANDARD 14)

add_executable(${PROJECT_NAME} main.cpp OgreApplication.cpp)

if (WIN32)
    message("OGRE_HOME = " $ENV{OGRE_HOME})

    set(OGRE_DIR  "$ENV{OGRE_HOME}/CMake")
    set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "$ENV{OGRE_HOME}/CMake")

    find_package(OGRE 1.12 REQUIRED COMPONENTS Bites RTShaderSystem)

    target_link_libraries(${PROJECT_NAME} ${OGRE_LIBRARIES})

    include_directories(
            $ENV{OGRE_HOME}/include/
            $ENV{OGRE_HOME}/include/OGRE/
            $ENV{OGRE_HOME}/include/OGRE/RTShaderSystem
            $ENV{OGRE_HOME}/boost/
    )

    file(GLOB OGRE_DLL "$ENV{OGRE_HOME}/bin/*.dll")
    file(COPY ${OGRE_DLL} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

    file(GLOB OGRE_LIB "$ENV{OGRE_HOME}/lib/*.lib")
    file(COPY ${OGRE_LIB} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
else ()
    find_package(OGRE 1.12 REQUIRED COMPONENTS Bites RTShaderSystem)
    # this also sets the includes and pulls third party dependencies
    target_link_libraries(${PROJECT_NAME} OgreBites OgreRTShaderSystem)
endif ()

# copy resource.cfg next to our binaries where OGRE looks for it
file(COPY ./resources.cfg DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
file(COPY ./plugins.cfg DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
file(COPY ./media DESTINATION ${CMAKE_CURRENT_BINARY_DIR})




