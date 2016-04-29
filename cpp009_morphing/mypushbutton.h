#ifndef MYPUSHBUTTON_H
#define MYPUSHBUTTON_H

#include <QWidget>
#include <QPushButton>

class MyPushButton : public QPushButton
{
public:
    MyPushButton(QWidget *parent = NULL);

    void timerEvent(QTimerEvent *);
    void paintEvent(QPaintEvent *);

private:
    bool m_useOwnPaint;
};

#endif // MYPUSHBUTTON_H
