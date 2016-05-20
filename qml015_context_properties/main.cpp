#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <qqml.h>
#include <carmodel.h>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;

    // Context property
    /*
    CarModel carModel;

    carModel.addCar(Car("Volvo V70", 2001));
    carModel.addCar(Car("Volvo 850", 1998));
    carModel.addCar(Car("Jeep Wrangler", 2004));
    carModel.addCar(Car("BMW Z28", 2005));
    carModel.addCar(Car("Batmobilen", 2001));
    carModel.addCar(Car("Fiat Punto", 2009));

    view.rootContext()->setContextProperty("carModel", &carModel);
    */

    // Register type
    //qmlRegisterType<CarModel>("com.jonas.components", 1, 0, "CarModel");

    // Plugin
//    QStringList paths = QCoreApplication::libraryPaths();
//    paths << qApp->applicationDirPath() + "/../../qml016_plugin";
//    qApp->setLibraryPaths(paths);
//    qDebug() << paths;

    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.setWidth(800);
    view.setHeight(600);
    view.show();

    return app.exec();
}
