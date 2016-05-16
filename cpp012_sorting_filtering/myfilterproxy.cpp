#include "myfilterproxy.h"

bool MyFilterProxy::filterAcceptsRow(int source_row, const QModelIndex &source_parent) const
{
    QModelIndex idx = sourceModel()->index(source_row, 0, source_parent);
    if (sourceModel()->data(idx).type() == QVariant::String) {
        QString str = sourceModel()->data(idx).toString();
        if (str.toLower().contains("erik"))
            return false;
    }
    return true;
}
