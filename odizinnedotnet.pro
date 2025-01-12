QT += quick

SOURCES += main.cpp

target.path = $$PWD/bin
INSTALLS += target

#wasm {
#    QMAKE_LFLAGS += -sASYNCIFY
#    QMAKE_LFLAGS += -sERROR_ON_UNDEFINED_SYMBOLS=0
#    QMAKE_LFLAGS += -sALLOW_MEMORY_GROWTH
#    QMAKE_LFLAGS += -sTOTAL_MEMORY=16MB
#}

RESOURCES +=                                                \
    resources.qrc                                 \

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
