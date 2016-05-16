#ifndef MYFILTERPROXY_H
#define MYFILTERPROXY_H

#include <QSortFilterProxyModel>

class MyFilterProxy : public QSortFilterProxyModel
{
public:
    bool filterAcceptsRow(int source_row, const QModelIndex &source_parent) const Q_DECL_OVERRIDE;
};

#endif // MYFILTERPROXY_H
