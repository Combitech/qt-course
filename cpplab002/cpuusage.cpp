#include "cpuusage.h"
#include <QFile>
#include <QDebug>

CpuUsage::CpuUsage(QObject *parent)
    : QAbstractTableModel(parent)
    , m_firstRun(true)
{
    timerEvent(NULL);
    startTimer(500);
}

int CpuUsage::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_prevStat.size();
}

int CpuUsage::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return 3;
}

QVariant CpuUsage::data(const QModelIndex &index, int role) const
{
    if (role == Qt::DisplayRole)
    {
        switch(index.column()) {
        case 0:
            return QString("CPU %1").arg(index.row() + 1);
            break;
        case 1:
            if (m_load.contains(index.row()))
                return m_load[index.row()];
            break;
        case 2:
            if (m_readTime.contains(index.row()))
                return m_readTime[index.row()].toString("hh:mm:ss.zzz");
            break;
        };
    }
    return QVariant();
}

void CpuUsage::timerEvent(QTimerEvent *ev)
{
    Q_UNUSED(ev);
    QFile f("/proc/stat");
    if (!f.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    int i = 0;
    QTextStream in(&f);
    QString line = in.readLine();
    while (!line.isNull()) {
        if (i++ > 0 && line.startsWith("cpu")) {
            int pos = line.indexOf(' ');
            int core = line.mid(3, pos - 3).toInt();
            CPUStat* stat = parseLine(line);

            if (!m_firstRun) {
                CPUStat* prev = m_prevStat[core];
                float usage = calculateCPUUsage(stat, prev);
                m_load[core] = usage;
                m_readTime[core] = QDateTime::currentDateTime();
                QModelIndex idx1 = this->createIndex(core, 0);
                QModelIndex idx2 = this->createIndex(core, 2);
                emit dataChanged(idx1, idx2);
                delete prev;
            }

            m_prevStat[core] = stat;
        }
        line = in.readLine();
    }
    m_firstRun = false;
    f.close();

}

CpuUsage::CPUStat* CpuUsage::parseLine(QString line)
{
    CPUStat *stat = new CPUStat();

    QList<QString> data = line.split(" ");
    stat->user = data[1].toInt();
    stat->nice = data[2].toInt();
    stat->system = data[3].toInt();
    stat->idle = data[4].toInt();
    stat->iowait = data[5].toInt();
    stat->irq = data[6].toInt();
    stat->softirq = data[7].toInt();
    stat->steal = data[8].toInt();

    return stat;
}

float CpuUsage::calculateCPUUsage(CPUStat *current, CPUStat *prev)
{
    int pIdle = prev->idle + prev->iowait;
    int idle = current->idle + current->iowait;

    int pNonIdle = prev->user + prev->nice + prev->irq + prev->softirq + prev->steal;
    int nonIdle = current->user + current->nice + current->irq + current->softirq + current->steal;

    int pTotal = pIdle + pNonIdle;
    int total = idle + nonIdle;

    int totaldiff = total - pTotal;
    int idlediff = idle - pIdle;

    return (float)(totaldiff - idlediff) / (float)(totaldiff) * 100.f;
}
