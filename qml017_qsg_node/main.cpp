#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

#include "triangle.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Triangle>("Polygons", 1, 0, "Triangle");

    QQuickView view;

    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.setWidth(800);
    view.setHeight(600);
    view.show();

    return app.exec();
}
