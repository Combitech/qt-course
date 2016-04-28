#include "mainwindow.h"
#include <QDebug>
#include <QEvent>
#include <QMouseEvent>

class FilterObj: public QObject
{
public:
    bool eventFilter(QObject *watched, QEvent *event)
    {
        if (event->type() == QEvent::MouseButtonPress) {
            QMouseEvent *mouseEv = static_cast<QMouseEvent*>(event);
            if (mouseEv->button() == Qt::RightButton) {
                qDebug() << "I dont like the right button.";
                return true;
            }
        }
        return false;
    }
};

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    setGeometry(10,10,400, 400);

    // TODO: Just uncomment the line below.
    //installEventFilter(new FilterObj);
}

MainWindow::~MainWindow()
{

}

void MainWindow::mousePressEvent(QMouseEvent *event)
{
    if (event->button() == Qt::LeftButton)
        qDebug() << "Left pressed";
    else
        qDebug() << "Right pressed";
}
