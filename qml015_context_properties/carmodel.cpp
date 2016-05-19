#include "carmodel.h"

Car::Car(const QString &name, const int &year)
    : m_name(name), m_year(year)
{
}
QString Car::name() const
{
    return m_name;
}

int Car::year() const
{
    return m_year;
}

CarModel::CarModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void CarModel::addCar(const Car &car)
{
    // Append car
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_cars << car;
    endInsertRows();
}

int CarModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return m_cars.count();
}

QVariant CarModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_cars.count())
        return QVariant();

    const Car &car = m_cars[index.row()];
    if (role == NameRole)
        return car.name();
    else if (role == YearRole)
        return car.year();
    return QVariant();
}

void CarModel::removeCar(const int idx)
{
    beginRemoveRows(QModelIndex(), idx, idx);
    m_cars.removeAt(idx);
    endRemoveRows();
}

void CarModel::insertCar(int idx, QString name, int year) {
    beginInsertRows(QModelIndex(), idx, idx);
    m_cars.insert(idx,Car(name,year));
    endInsertRows();
}

QHash<int, QByteArray> CarModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[YearRole] = "year";
    return roles;
}
