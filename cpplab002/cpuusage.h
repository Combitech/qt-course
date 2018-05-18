#ifndef CPUUSAGE_H
#define CPUUSAGE_H

#include <QAbstractTableModel>
#include <QDateTime>

class CpuUsage : public QAbstractTableModel
{
    Q_OBJECT
    class CPUStat
    {
    public:
        int user;
        int nice;
        int system;
        int idle;
        int iowait;
        int irq;
        int softirq;
        int steal;
    };

public:
    CpuUsage(QObject *parent = Q_NULLPTR);

    int rowCount(const QModelIndex &parent) const;
    int columnCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;

protected:
    void timerEvent(QTimerEvent *ev);

private:
    CPUStat* parseLine(QString line);
    float calculateCPUUsage(CPUStat *current, CPUStat *prev);

    QMap<int, CPUStat*> m_prevStat;
    QMap<int, float> m_load;
    QMap<int, QDateTime> m_readTime;

    bool m_firstRun;
};

#endif // CPUUSAGE_H
