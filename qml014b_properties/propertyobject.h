#ifndef PROPERTYOBJECT_H
#define PROPERTYOBJECT_H

#include <QObject>

class PropertyObject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int progress READ progress NOTIFY progressChanged)
    Q_PROPERTY(int noClicks READ noClicks WRITE setNoClicks NOTIFY noClicksChanged)
public:
    explicit PropertyObject(QObject *parent = 0);

    int progress() const;
    int noClicks() const;

    Q_INVOKABLE void resetNoClicks();
signals:
    void progressChanged();
    void noClicksChanged();

public slots:
    void setNoClicks(const int clicks);

protected:
    void timerEvent(QTimerEvent *event);

private:

    int m_progress;
    int m_clicks;
};

#endif // PROPERTYOBJECT_H
