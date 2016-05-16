#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QStandardItemModel>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{    
    ui->setupUi(this);

    delegate = new MyDelegate(this);

    QStandardItemModel *model = new QStandardItemModel(4,2,this);

    // Generate data
    for(int row = 0; row < 4; row++)
    {
        for(int col = 0; col < 2; col++)
        {
            QModelIndex index = model->index(row,col,QModelIndex());
            model->setData(index,0);
        }
    }

    ui->tableView->setModel(model);
    ui->tableView->setItemDelegate(delegate);
}

MainWindow::~MainWindow()
{
    delete ui;
}
