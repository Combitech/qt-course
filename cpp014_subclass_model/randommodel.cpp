#include "randommodel.h"

#include <QTime>
#include <QDebug>

RandomModel::RandomModel(QObject *parent)
    : QAbstractTableModel(parent)
    , m_tableSize(1,1)
{
    QTime time = QTime::currentTime();
    qsrand((uint)time.msec());
    startTimer(50);
}

int RandomModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_tableSize.height();
}

int RandomModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_tableSize.width();
}

QVariant RandomModel::data(const QModelIndex &index, int role) const
{
    if (role == Qt::DisplayRole) {
        QPoint pnt(index.column(), index.row());
        if (m_data.contains(pnt)) {
            return m_data.value(pnt);
        }
    }
    return QVariant();
}

int RandomModel::randomNumber(int min, int max)
{
    return qrand() % ((max + 1) - min) + min;
}

void RandomModel::timerEvent(QTimerEvent *event)
{
    Q_UNUSED(event);
    int val = randomNumber(0, 6);
    switch (val) {
    case 0:
        changeTableWidth();
        break;
    case 1:
        changeTableHeight();
        break;
    case 2:
    case 3:
    case 4:
        changeData();
        break;
    default:
        break;
    }
}

void RandomModel::changeTableWidth()
{
    int val = randomNumber(1, 10);
    qDebug() << val << m_tableSize.width();
    if (val > m_tableSize.width()) {
        beginInsertColumns(QModelIndex(), 0, val - m_tableSize.width());
        m_tableSize.setWidth(val);
        endInsertColumns();
    } else if (val < m_tableSize.width()) {
        beginRemoveColumns(QModelIndex(), 0, m_tableSize.width() - val);
        m_tableSize.setWidth(val);
        endRemoveColumns();
    }
    qDebug() << Q_FUNC_INFO << m_tableSize;
}

void RandomModel::changeTableHeight()
{
    int val = randomNumber(1, 10);
    if (val > m_tableSize.height()) {
        beginInsertRows(QModelIndex(), 0, val - m_tableSize.height());
        m_tableSize.setHeight(val);
        endInsertRows();
    } else {
        beginRemoveRows(QModelIndex(), 0, m_tableSize.height() - val);
        m_tableSize.setHeight(val);
        endRemoveRows();
    }
    qDebug() << Q_FUNC_INFO << m_tableSize;
}

void RandomModel::changeData()
{
    int x = randomNumber(0,m_tableSize.width());
    int y = randomNumber(0, m_tableSize.height());
    int v = randomNumber(0, 100);
    m_data[QPoint(x,y)] = v;
    QModelIndex idx = this->createIndex(x, y);
    emit dataChanged(idx, idx);
}
