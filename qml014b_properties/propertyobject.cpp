#include "propertyobject.h"
#include <QTime>

PropertyObject::PropertyObject(QObject *parent)
    : QObject(parent)
    , m_progress(0)
    , m_clicks(0)
{
    QTime time = QTime::currentTime();
    qsrand((uint)time.msec());

    startTimer(1000);
}

int PropertyObject::progress() const
{
    return m_progress;
}

int PropertyObject::noClicks() const
{
    return m_clicks;
}

void PropertyObject::setNoClicks(const int clicks)
{
    if (m_clicks != clicks) {
        m_clicks = clicks;
        emit noClicksChanged();
    }
}

void PropertyObject::resetNoClicks()
{
    if (m_clicks == 0)
        return;

    m_clicks = 0;
    emit noClicksChanged();
}

void PropertyObject::timerEvent(QTimerEvent *event)
{
    Q_UNUSED(event)

    int r = qrand() % 100;
    if (r != m_progress) {
        m_progress = r;
        emit progressChanged();
    }
}
