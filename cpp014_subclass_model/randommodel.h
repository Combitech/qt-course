#ifndef RANDOMMODEL_H
#define RANDOMMODEL_H

#include <QObject>
#include <QSize>
#include <QPoint>
#include <QAbstractTableModel>

inline uint qHash (const QPoint & key)
{
    return qHash (static_cast <qint64> (key.x () ) << 32 | key.y () );
}

class RandomModel : public QAbstractTableModel
{
    Q_OBJECT
public:
    RandomModel(QObject *parent);

    int rowCount(const QModelIndex &parent = QModelIndex()) const ;
    int columnCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

protected:
    void timerEvent(QTimerEvent *event);

private:
    int randomNumber(int min, int max);

    void changeTableWidth();
    void changeTableHeight();
    void changeData();

    QSize m_tableSize;
    QHash<QPoint, QVariant> m_data;
};

#endif // RANDOMMODEL_H
