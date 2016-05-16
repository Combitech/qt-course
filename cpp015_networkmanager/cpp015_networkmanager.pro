#-------------------------------------------------
#
# Project created by QtCreator 2016-05-16T19:50:07
#
#-------------------------------------------------

QT       += core gui
QT       += network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = cpp015_networkmanager
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    weathermodel.cpp

HEADERS  += mainwindow.h \
    weathermodel.h

FORMS    += mainwindow.ui
