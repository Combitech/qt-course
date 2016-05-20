#ifndef CPULOADER_H
#define CPULOADER_H

#include <QObject>

class CPULoader : public QObject
{
    Q_OBJECT
public:
    explicit CPULoader(QObject *parent = 0);

protected:
    void timerEvent(QTimerEvent *ev);

private:
    int randomNumber(int min, int max);
};

#endif // CPULOADER_H
