#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;

    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.setWidth(1000);
    view.setHeight(700);
    view.show();

    return app.exec();
}
