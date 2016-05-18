#include "weathermodel.h"
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>
#include <QTimer>

WeatherModel::WeatherModel(QObject *parent)
    :QAbstractTableModel(parent)
{
    connect(&m_networkmanager, &QNetworkAccessManager::finished,
            this, &WeatherModel::replyFinished);
}

int WeatherModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_results.size();
}

int WeatherModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return 3;
}

QVariant WeatherModel::data(const QModelIndex &index, int role) const
{
    if (role == Qt::DisplayRole) {
        QHash<QUrl, Report*>::const_iterator i = m_results.constBegin();
        Report *r = NULL;
        while (i != m_results.constEnd()) {
            Report *currentReport = i.value();
            if (currentReport->pos == index.row())
                r = currentReport;
            ++i;
        }

        if (!r)
            return QVariant();

        switch(index.column()) {
        case 0:
            return r->city;
            break;
        case 1:
            return r->weather;
            break;
        case 2:
            return r->lastSync.toLocalTime().toString("HH:mm:ss.zzz");
            break;
        default:
            break;
        };
    }
    return QVariant();
}

void WeatherModel::addCity(QString city)
{
    QUrl url = "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition.text%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22" + city + "%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
    if (!m_results.contains(url)) {

        Report *r = new Report();
        r->pos = rowCount();
        r->city = city;

        beginInsertRows(QModelIndex(), r->pos, r->pos);
        m_results.insert(url, r);
        endInsertRows();

        m_networkmanager.get(QNetworkRequest(url));
    }
}

void WeatherModel::replyFinished(QNetworkReply *reply)
{
    QByteArray data = reply->readAll();
    qDebug() << data;

    QJsonDocument doc = QJsonDocument::fromJson(data);

    QJsonObject query = doc.object().value("query").toObject();
    if (query.contains("results")) {
        QJsonObject res = query.value("results").toObject();
        QJsonObject cond = res.value("channel").toObject().value("item").toObject().value("condition").toObject();

        //m_results[reply->url()] = cond.value("text").toString();
        if (m_results.contains(reply->url())) {
            Report* r = m_results.value(reply->url());
            r->weather = cond.value("text").toString();
            r->lastSync = QDateTime::currentDateTime();
            emit dataChanged(createIndex(r->pos, 1),
                             createIndex(r->pos, 3));

            QTimer *t = new QTimer();
            t->setInterval(3000);
            t->setSingleShot(true);
            // Passing data in this way is simple, but not really pretty....
            t->setObjectName(reply->url().toString());
            connect(t, &QTimer::timeout,
                    this, &WeatherModel::updateData);
            t->start();
        }
    }
}

void WeatherModel::updateData()
{
    QUrl url = sender()->objectName();
    sender()->deleteLater();

    m_networkmanager.get(QNetworkRequest(url));
}
