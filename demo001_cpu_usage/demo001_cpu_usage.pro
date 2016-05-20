#-------------------------------------------------
#
# Project created by QtCreator 2016-05-18T19:19:52
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = demo001_cpu_usage
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    cpuusage.cpp \
    cpuloader.cpp

HEADERS  += mainwindow.h \
    cpuusage.h \
    cpuloader.h

FORMS    += mainwindow.ui
