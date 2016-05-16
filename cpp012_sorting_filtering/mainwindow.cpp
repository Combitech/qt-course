#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QSortFilterProxyModel>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->listView->setModel(&m_sort);

    connect(ui->btnSort, &QPushButton::clicked,
            this, &MainWindow::updateModelChain);
    connect(ui->btnFilter, &QPushButton::clicked,
            this, &MainWindow::updateModelChain);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_btnAdd_clicked()
{
    QStringList l = m_model.stringList();
    l << ui->lineEdit->text();
    m_model.setStringList(l);
    ui->lineEdit->clear();
}

void MainWindow::updateModelChain()
{
    QAbstractItemModel* model = &m_model;

    if (ui->btnSort->isChecked()) {
        qDebug() << "Add sort";
        m_sort.setSourceModel(model);
        m_sort.setDynamicSortFilter(true);
        //m_sort.setSortRole(Qt::DisplayRole);
        model = &m_sort;
    }

    if (ui->btnFilter->isChecked()) {
        m_filter.setSourceModel(model);
        model = &m_filter;
    }

    ui->listView->setModel(model);
}
