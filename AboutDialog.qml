import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Window 2.0

Window {
    width: 300
    height: 150
    minimumHeight: height
    minimumWidth: width
    maximumHeight: height
    maximumWidth: width

    Rectangle {
        id: rectangle1
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: aboutTitleText
            width: 174
            height: 22
            text: qsTr("NStatCounter")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.underline: true
            font.bold: false
            font.pointSize: 15
        }

        Text {
            id: aboutDescriptionText
            x: 5
            y: 27
            width: 185
            height: 48
            text: "A simple stat calculator for Nowhere-else and Beyond. This is designed to replace an older version that wasn't cross-platform."
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors.top: aboutTitleText.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 0
            font.pixelSize: 12
        }

        Text {
            id: aboutCopyrightText
            x: 5
            y: 108
            width: 184
            height: 41
            text: qsTr("Copyright 2013 Kevin Ott (Etzos)<br>Licensed under the GPLv3")
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            font.pixelSize: 12
        }
    }
}
/*
Rectangle {
    id: rectangle2
    width: 300
    height: 150
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#5495c6"
        }

        GradientStop {
            position: 1
            color: "#103473"
        }
    }
    border.color: "#000000"

    Rectangle {
        id: rectangle1
        radius: 0
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        border.color: "#000000"
        z: 0

        Text {
            id: text1
            width: 174
            height: 22
            text: qsTr("NStatCounter")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.underline: true
            font.bold: false
            font.pointSize: 15
            font.pixelSize: 12
        }

        Text {
            id: text2
            width: 185
            height: 48
            text: "A simple stat calculator for Nowhere-else and Beyond. This is designed to replace an older version that wasn't cross-platform."
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors.top: text1.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 0
            font.pixelSize: 12
        }

        Text {
            id: text3
            x: 5
            y: 99
            width: 184
            height: 41
            text: qsTr("Copyright 2013 Kevin Ott (Etzos)<br>Licensed under the GPLv3")
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            font.pixelSize: 12
        }
    }
}*/
