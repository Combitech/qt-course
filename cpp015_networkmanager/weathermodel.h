#ifndef WEATHERMODEL_H
#define WEATHERMODEL_H

#include <QAbstractTableModel>
#include <QHash>
#include <QMap>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QDateTime>

class WeatherModel : public QAbstractTableModel
{
    Q_OBJECT

    class Report {
    public:
        int pos;
        QDateTime lastSync;
        QString weather;
        QString city;
    };

public:
    WeatherModel(QObject *parent);

    int rowCount(const QModelIndex &parent = QModelIndex()) const ;
    int columnCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

public slots:
    void addCity(QString city);
    void updateData();

private slots:
    void replyFinished(QNetworkReply *reply);

private:
    QHash<QUrl, Report*> m_results;

    QNetworkAccessManager m_networkmanager;
};

#endif // WEATHERMODEL_H
