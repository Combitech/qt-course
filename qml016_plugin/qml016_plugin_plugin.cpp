#include "qml016_plugin_plugin.h"
#include "carmodel.h"

#include <qqml.h>

void Qml016_PluginPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<CarModel>("plugin.jonas.components", 1, 0, "CarModel");
}

