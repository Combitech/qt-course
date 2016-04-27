#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // Connect some typing signal
    connect(ui->lineEdit, &QLineEdit::textChanged,
            this, &MainWindow::onTyping);

    // Add items to the combo box
    ui->comboBox->addItem("");
    ui->comboBox->addItem("Male");
    ui->comboBox->addItem("Female");

    // Connect combo box selection
    connect(ui->comboBox, &QComboBox::currentTextChanged,
            this, &MainWindow::onComboBoxSelection);

    // TODO: Add a auto-connected signal for dateedit
    //       Hint, a good signal is dateChanged(const QDate &date)

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::onTyping()
{
    ui->statusBar->showMessage("Typing...");
}

void MainWindow::onComboBoxSelection(QString text)
{
    ui->statusBar->showMessage("Selected gender: " + text);
}
