cmake_minimum_required(VERSION 3.0)
project(hello-ogre3d)

set(CMAKE_CXX_STANDARD 14)

add_executable(${PROJECT_NAME} main.cpp OgreApplication.cpp)
target_link_libraries(${PROJECT_NAME} zzip)



# specify which version and components you need
find_package(OGRE 1.12 REQUIRED COMPONENTS Bites RTShaderSystem)

# copy resource.cfg next to our binaries where OGRE looks for it
file(COPY ./resources.cfg DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
file(COPY ./plugins.cfg   DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
file(COPY ./media         DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

# this also sets the includes and pulls third party dependencies
target_link_libraries(${PROJECT_NAME} OgreBites OgreRTShaderSystem)
