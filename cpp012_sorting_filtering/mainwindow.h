#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QStringListModel>
#include <QSortFilterProxyModel>
#include <QDebug>

#include "myfilterproxy.h"
#include "mysortproxy.h"

namespace Ui {
class MainWindow;
}

class MySortProxy;
class MyFilterProxy;
class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

public slots:
    void on_btnAdd_clicked();
    void updateModelChain();

private:

    Ui::MainWindow *ui;
    QStringListModel m_model;
    MyFilterProxy m_filter;
    MySortProxy m_sort;
};

#endif // MAINWINDOW_H
