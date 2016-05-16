#ifndef MYSORTPROXY_H
#define MYSORTPROXY_H

#include <QSortFilterProxyModel>

class MySortProxy : public QSortFilterProxyModel
{
public:
    MySortProxy(QObject *parent = NULL);

protected:
    bool lessThan(const QModelIndex &source_left, const QModelIndex &source_right) const Q_DECL_OVERRIDE;
};

#endif // MYSORTPROXY_H
