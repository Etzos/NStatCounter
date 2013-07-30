import QtQuick 2.0
import QtQuick.Controls 1.0

Item {
    id: item1
    property string name: "Action Points"
    property int totalAP: 6
    property int usedAP: 0

    Label {
        id: apLabel
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true

        text: parent.name + ": "
    }

    Text {
        id: apDisplay

        font.pixelSize: 12

        text: parent.usedAP + "/" + parent.totalAP
        anchors.left: apLabel.right
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter
    }

    Label {
        id: apRemainingLabel
        font.bold: true

        text: "Remaining: "
        anchors.verticalCenterOffset: 0
        anchors.left: apDisplay.right
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        id: apRemaing
        font.pixelSize: 12

        text: parent.totalAP - parent.usedAP
        anchors.left: apRemainingLabel.right
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter
    }

}
