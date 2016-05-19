#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(ui->pushButton, &QPushButton::clicked,
            this, &MainWindow::onButtonOne);
    connect(ui->pushButton_2, &QPushButton::clicked,
            this, &MainWindow::onButtonTwo);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::onButtonOne()
{
    qDebug() << "Button one pressed";
}

void MainWindow::onButtonTwo()
{
    qDebug() << "Button two pressed";
}
