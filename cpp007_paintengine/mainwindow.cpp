#include "mainwindow.h"
#include <QPainter>
#include <QPaintEvent>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , m_size(100)
{
    setGeometry(100,100, 500, 500);
    //startTimer(1000 / 60); // Timer for 60 FPS
}

MainWindow::~MainWindow()
{
}

void MainWindow::paintEvent(QPaintEvent *event)
{
    QPainter p(this);
    p.setRenderHint(QPainter::Antialiasing);

    p.drawLine(QPoint(0,0), QPoint(size().width(), size().height()));
    p.drawArc(QRect(QPoint(0,0), QPoint(size().width(), size().height())),
              -45*16, 180*16);

    QPen pen(Qt::green, 3, Qt::DashDotLine, Qt::RoundCap, Qt::RoundJoin);
    p.setPen(pen);
    p.drawArc(QRect(QPoint(0,0), QPoint(size().width(), size().height())),
              0*16, 45*16);

    QImage lejon(":/lejon.jpg");
    p.drawImage(QRect(0,0, m_size, m_size), // Target rect
                lejon, // Source image
                QRect(0,0, lejon.width(), lejon.height() ));

    qDebug() << "Need to update: " << event->rect();
}

void MainWindow::timerEvent(QTimerEvent *)
{
    if (m_size++ > 500)
        m_size = 100;

    update();
}
