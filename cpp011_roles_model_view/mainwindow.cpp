#include "mainwindow.h"
#include "ui_mainwindow.h"

#include "mymodel.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->tableView->setModel(new MyModel(this));
}

MainWindow::~MainWindow()
{
    delete ui;
}
