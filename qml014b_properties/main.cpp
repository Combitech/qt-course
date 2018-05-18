#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>
#include "propertyobject.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    view.rootContext()->setContextProperty("po", new PropertyObject(&view));
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.show();

    return app.exec();
}
