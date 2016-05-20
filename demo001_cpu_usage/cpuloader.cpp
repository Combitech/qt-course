#include "cpuloader.h"
#include <QThreadPool>
#include <QRunnable>
#include <QTime>
#include <QDebug>

class LucasLehmer : public QRunnable {
public:
    LucasLehmer(int p)
    {
        qDebug() << "Testsing if" << p << "is a prime";
        m_p = p;
    }

    void run() {
        /*
        var s = 4
            var M = 2p − 1
            repeat p − 2 times:
                s = ((s × s) − 2) mod M
            if s == 0 return PRIME else return COMPOSITE*/
        int s = 4;
        int M = pow(2, m_p) - 1;
        for (int i=0; i<m_p-2; i++)
            s = (s*s - 2) % M;

        if (s == 0) {
            qDebug() << m_p << "is a prime";
        }
    }
private:
    int m_p;
};

CPULoader::CPULoader(QObject *parent) : QObject(parent)
{
    QTime time = QTime::currentTime();
    qsrand((uint)time.msec());

    startTimer(50);
}

void CPULoader::timerEvent(QTimerEvent *ev)
{
    Q_UNUSED(ev)
    LucasLehmer *ll = new LucasLehmer(randomNumber(0, INT16_MAX));
    QThreadPool::globalInstance()->start(ll);
}

int CPULoader::randomNumber(int min, int max)
{
    return qrand() % ((max + 1) - min) + min;
}
