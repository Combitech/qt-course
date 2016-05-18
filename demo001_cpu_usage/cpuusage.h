#ifndef CPUUSAGE_H
#define CPUUSAGE_H

#include <QObject>
#include <QMap>

class CPUUsage : public QObject
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
    explicit CPUUsage(QObject *parent = 0);

signals:

public slots:

protected:
    void timerEvent(QTimerEvent *ev);
    CPUStat* parseLine(QString line);
    float calculateCPUUsage(CPUStat *current, CPUStat *prev);
private:

    QMap<int, CPUStat*> m_prevStat;
    bool m_firstRun;
};

#endif // CPUUSAGE_H
