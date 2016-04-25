// Copyright (C) 2016 Pelagicore
//
// You may use this file under the terms of the GPLv3 license.
// See the file LICENSE from this package for details.
//
// SPDX-License-Identifier: GPL-3.0

#ifndef NODEWRAPPER_H
#define NODEWRAPPER_H

#include <QList>
#include <QMap>



class NodeWrapper {
public:
    NodeWrapper(const QString value, const QString valueType, const QString nodeType,
                quint32 row, quint32 col, const QStringRef source, const QMap<QString, bool> tokenMap):
        value(value), valueType(valueType), nodeType(nodeType), row(row), col(col),
        source(source), tokenMap(tokenMap) {}

    NodeWrapper(const NodeWrapper *other);

    ~NodeWrapper();

    void addChild(NodeWrapper *node);
    const QString getValue();
    const QString getValueType();
    const QString getNodeType();
    const QStringRef getSource();
    const quint32 getRow();
    const quint32 getCol();
    const QList<NodeWrapper *>& getChildren();
    const QMap<QString, bool>& getTokenMap();
    void print();

    const QList<NodeWrapper*> getNodes(QString nodeType);
    const QString getId();

    QString getOutput();

private:
    QList<NodeWrapper *> children;
    const QMap<QString, bool> tokenMap;
    const QString value;
    const QString valueType;
    const QString nodeType;
    const quint32 row;
    const quint32 col;
    const QStringRef source;

    void innerPrint(const int);
    void innerGetNodes(QStringList searchList, const QStringList& originalList, QList<NodeWrapper*>& nodes);
};

#endif // NODEWRAPPER_H
