#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "weathermodel.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->tableView->setModel(new WeatherModel(this));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_btnAdd_clicked()
{
    WeatherModel* model = qobject_cast<WeatherModel*>(ui->tableView->model());
    if (model) {
        model->addCity(ui->txtCity->text());
        ui->txtCity->clear();
    }
}
