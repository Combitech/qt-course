#ifndef CARMODEL_H
#define CARMODEL_H

#include <QAbstractListModel>
#include <QStringList>

class Car
{
public:
    Car(const QString &name, const int &year);

    QString name() const;
    int year() const;

private:
    QString m_name;
    int m_year;
};

class CarModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum AnimalRoles {
        NameRole = Qt::UserRole + 1,
        YearRole
    };

    CarModel(QObject *parent = 0);

    void addCar(const Car &car);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    Q_INVOKABLE void insertCar(int idx, QString name, int year);
    Q_INVOKABLE void removeCar(const int idx);

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Car> m_cars;
};

#endif // CARMODEL_H
