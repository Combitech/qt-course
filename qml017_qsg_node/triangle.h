#ifndef TRIANGLE_H
#define TRIANGLE_H

#include <QtQuick/QQuickItem>

class Triangle : public QQuickItem
{
    Q_OBJECT

    Q_PROPERTY(QPointF p1 READ p1 WRITE setP1 NOTIFY p1Changed)
    Q_PROPERTY(QPointF p2 READ p2 WRITE setP2 NOTIFY p2Changed)
    Q_PROPERTY(QPointF p3 READ p3 WRITE setP3 NOTIFY p3Changed)
    Q_PROPERTY(QColor lineColor READ lineColor WRITE setLineColor NOTIFY lineColorChanged)

public:
    Triangle(QQuickItem *parent = 0);
    ~Triangle();

    QSGNode *updatePaintNode(QSGNode *, UpdatePaintNodeData *);

    QPointF p1() const { return m_p1; }
    QPointF p2() const { return m_p2; }
    QPointF p3() const { return m_p3; }

    void setP1(const QPointF &p);
    void setP2(const QPointF &p);
    void setP3(const QPointF &p);

    QColor lineColor() const;

public slots:
    void setLineColor(QColor lineColor);

signals:
    void p1Changed(const QPointF &p);
    void p2Changed(const QPointF &p);
    void p3Changed(const QPointF &p);

    void lineColorChanged(QColor lineColor);

private:
    QPointF m_p1;
    QPointF m_p2;
    QPointF m_p3;

    QColor m_lineColor;
};

#endif // TRIANGLE_H
