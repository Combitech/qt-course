#-------------------------------------------------
#
# Project created by QtCreator 2016-04-29T12:22:28
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = cpp012_sorting_filtering
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    mysortproxy.cpp \
    myfilterproxy.cpp

HEADERS  += mainwindow.h \
    mysortproxy.h \
    myfilterproxy.h

FORMS    += mainwindow.ui
