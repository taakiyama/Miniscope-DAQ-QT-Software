QT += qml quick widgets
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        backend.cpp \
        behaviorcam.cpp \
        behaviortracker.cpp \
        controlpanel.cpp \
        datasaver.cpp \
        main.cpp \
        miniscope.cpp \
        newquickview.cpp \
        videodisplay.cpp \
        videostreamocv.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    backend.h \
    behaviorcam.h \
    behaviortracker.h \
    controlpanel.h \
    datasaver.h \
    miniscope.h \
    newquickview.h \
    videodisplay.h \
    videostreamocv.h

DISTFILES +=

win32 {
    # Path to your openCV .lib file(s)
    LIBS += -LC:/opencv-4.4.0/build/lib/Release -lopencv_world440
##    LIBS += -LC:/opencv-4.4.0/build/lib/Debug -lopencv_world440d

    # Path to openCV header files
    INCLUDEPATH += C:/opencv-4.4.0/build/install/include

    # Do we need DEPENDPATH ????
#    #DEPENDPATH +=
} else {
    CONFIG += link_pkgconfig
    PKGCONFIG += opencv4
}

# Move user and device configs to build directory
copydata.commands = $(COPY_DIR) \"$$shell_path($$PWD\\..\\deviceConfigs)\" \"$$shell_path($$OUT_PWD\\deviceConfigs)\"
copydata2.commands = $(COPY_DIR) \"$$shell_path($$PWD\\..\\userConfigs)\" \"$$shell_path($$OUT_PWD\\userConfigs)\"
first.depends = $(first) copydata copydata2
export(first.depends)
export(copydata.commands)
export(copydata2.commands)

QMAKE_EXTRA_TARGETS += first copydata copydata2
