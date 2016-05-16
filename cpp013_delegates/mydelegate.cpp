#include "mydelegate.h"

#include <QSpinBox>
#include <QDebug>

MyDelegate::MyDelegate(QObject *parent)
    : QItemDelegate(parent)
{
    qDebug() << Q_FUNC_INFO;
}

QWidget* MyDelegate::createEditor(QWidget *parent,
                                  const QStyleOptionViewItem &option,
                                  const QModelIndex &index) const
{
    Q_UNUSED(option);
    Q_UNUSED(index);

    qDebug() << Q_FUNC_INFO;

    QSpinBox *editor = new QSpinBox(parent);
    editor->setMinimum(0);
    editor->setMaximum(100);
    return editor;
}

void MyDelegate::setEditorData(QWidget *editor,
                               const QModelIndex &index) const
{
    // Get the value via index of the Model
    int value = index.model()->data(index, Qt::EditRole).toInt();

    // Put the value into the SpinBox
    QSpinBox *spinbox = static_cast<QSpinBox*>(editor);
    spinbox->setValue(value);
}

void MyDelegate::setModelData(QWidget *editor, QAbstractItemModel *model,
                              const QModelIndex &index) const
{
    QSpinBox *spinbox = static_cast<QSpinBox*>(editor);
    spinbox->interpretText();
    int value = spinbox->value();
    model->setData(index, value, Qt::EditRole);
}

// Give the SpinBox the info on size and location
void MyDelegate::updateEditorGeometry(QWidget *editor,
                                      const QStyleOptionViewItem &option,
                                      const QModelIndex &index) const
{
    editor->setGeometry(option.rect);
}
