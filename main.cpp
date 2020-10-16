#include "OgreApplication.h"

int main() {
    OgreApplication app;
    app.initApp();
    app.getRoot()->startRendering();
    app.closeApp();
    return 0;
}
