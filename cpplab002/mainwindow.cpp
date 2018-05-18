#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "cpuusage.h"
#include "cpuloader.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->tableView->setModel(new CpuUsage(this));
    new CPULoader(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}
