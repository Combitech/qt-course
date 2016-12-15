#include "mysortproxy.h"
#include <QDebug>

MySortProxy::MySortProxy(QObject *parent)
    : QSortFilterProxyModel(parent)
{
}

bool MySortProxy::lessThan(const QModelIndex &source_left, const QModelIndex &source_right) const
{
    QVariant leftData  = sourceModel()->data(source_left);
    QVariant rightData = sourceModel()->data(source_right);
qDebug() << "Data:" << leftData << rightData;
    if (leftData.type() == QVariant::String &&
        rightData.type() == QVariant::String) {
        qDebug() << "asdf";
        return QString::localeAwareCompare(leftData.toString(),
                                           rightData.toString());
    }
    return false;
}
