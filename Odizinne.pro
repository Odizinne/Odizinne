QT += quick

SOURCES += main.cpp

target.path = $$PWD/bin
INSTALLS += target

RESOURCES += \
    Resources/resources.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
