import QtQuick 2.0
import QtQuick.Controls 1.0

Item {

    property string name: "Stat"
    property string value: "n/a"

    height: 20
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0

    Label {
        text: parent.name
        anchors.left: parent.left
        anchors.leftMargin: 6
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true
    }

    Text {
        text: parent.value
        anchors.left: parent.left
        anchors.leftMargin: 110
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 12
    }
}
