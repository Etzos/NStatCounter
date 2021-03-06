import QtQuick 2.0
import QtQuick.Controls 1.0

Item {
    id: rootItem
    height: 25

    property int value: 1
    property int max: 1
    property int min: 1
    property int remainingValues: 1
    property string name: "Stat"

    /*onValueChanged: {
        if(value > max) {
            value = max;
        }
    }*/

    Label {
        id: statLabel
        y: 4
        text: parent.name
        anchors.left: parent.left
        anchors.leftMargin: 6
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true
    }

    ProgressBar {
        id: statBar
        y: 1
        height: 22
        anchors.verticalCenterOffset: 0
        anchors.right: statSpinner.left
        anchors.rightMargin: 3
        anchors.left: parent.left
        anchors.leftMargin: 90
        anchors.verticalCenter: parent.verticalCenter

        maximumValue: 100
        minimumValue: 0

        value: Math.min( ((parent.value/parent.max) * 100), maximumValue )
    }

    SpinBox {
        id: statSpinner
        x: 552
        y: 0
        width: 60
        height: 22
        anchors.right: parent.right
        anchors.rightMargin: 3
        anchors.verticalCenter: parent.verticalCenter

        maximumValue: parent.value+parent.remainingValues
        minimumValue: parent.min
        value: parent.value

        onValueChanged: {
            parent.value = value;
        }
    }
}

