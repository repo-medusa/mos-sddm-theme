/*
    SPDX-FileCopyrightText: 2024 fakelog <i@fakelog.ru>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15 as QQC2

ColumnLayout {
    id: root

    property date dateTime: new Date()

    QQC2.Label {
        text: Qt.formatDate(root.dateTime, Qt.locale(), "dddd, d MMMM")
        font.pointSize: Math.round(Qt.application.font.pointSize * 2)
        Layout.alignment: Qt.AlignHCenter
    }
    QQC2.Label {
        text: Qt.formatTime(root.dateTime, Qt.locale(), Locale.ShortFormat)
        font.pointSize: Math.round(Qt.application.font.pointSize * 8)
        font.weight: Font.Bold
        Layout.alignment: Qt.AlignHCenter
    }
    Timer {
        interval: 1000; running: true; repeat: true;
        onTriggered: root.dateTime = new Date()
    }
}
