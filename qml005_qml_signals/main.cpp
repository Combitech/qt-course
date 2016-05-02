#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.setWidth(600);
    view.setHeight(800);
    view.show();

    return app.exec();
}
