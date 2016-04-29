#include "mypushbutton.h"
#include <QPainter>

MyPushButton::MyPushButton(QWidget *parent)
    : QPushButton(parent)
    , m_useOwnPaint(false)
{
    startTimer(1000);
}

void MyPushButton::timerEvent(QTimerEvent *)
{
    m_useOwnPaint = !m_useOwnPaint;
    update();
}

void MyPushButton::paintEvent(QPaintEvent *e)
{
    if (!m_useOwnPaint) {
        QPushButton::paintEvent(e);
    } else {
        QPainter p(this);
        QRect r(5,5, geometry().width() - 10, geometry().height() - 10);
        p.drawRect(r);
    }
}

