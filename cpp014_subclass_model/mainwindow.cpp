#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "randommodel.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->tableView->setModel(new RandomModel(this));
}

MainWindow::~MainWindow()
{
    delete ui;
}
