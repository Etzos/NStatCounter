import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.0

import "utilities.js" as Util

ApplicationWindow {
    id: mainWindow
    title: "NStatCounter"
    width: 450
    height: 400
    minimumWidth: 400
    minimumHeight: 375

    function updateStats() {
        // This gets the values and calls the functions for updating
        var lvl = levelSpinner.value | 1;
        var str = strSpinner.value | 2;
        var dex = dexSpinner.value | 2;
        var itl = intSpinner.value | 1;
        var cha = chaSpinner.value | 1;

        var hitChance = Util.calcHitChance(dex, lvl);
        hitChanceVal.text = hitChance + "%";
    }
    
    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Open")
            }
            MenuItem {
                text: qsTr("Save")
            }

            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }

        Menu {
            title: qsTr("Help")
            MenuItem {
                text: qsTr("About NStatCounter...")
                onTriggered: tmpWin.setVisible(true)
            }
        }
    }

    Window {
        id: tmpWin
        width: 300
        height: 150
        minimumHeight: tmpWin.height
        minimumWidth: tmpWin.width
        maximumHeight: tmpWin.height
        maximumWidth: tmpWin.width

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
                    font.pixelSize: 12
                }

                Text {
                    id: aboutDescriptionText
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
        }
    }

    GridLayout {
        id: gridlayout1
        anchors.fill: parent
        columns: 1

        GroupBox {
            id: statsBox
            width: 630
            height: 197
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            transformOrigin: Item.Center
            checkable: false
            checked: true
            flat: false
            title: qsTr("Stats")

            Item {
                id: levelItem
                width: 122
                height: 31
                anchors.top: parent.top
                anchors.topMargin: 3
                anchors.left: parent.left
                anchors.leftMargin: 3

                Label {
                    id: levelLabel
                    x: 8
                    y: 8
                    text: "Level"
                    font.bold: true
                }

                SpinBox {
                    id: levelSpinner
                    x: 53
                    y: 4
                    width: 60
                    value: 1
                    //onValueChanged: updateStats
                }
            }

            ColumnLayout {
                id: statLayout
                height: 124
                anchors.top: levelItem.bottom
                anchors.topMargin: 3
                anchors.right: parent.right
                anchors.rightMargin: 3
                anchors.left: parent.left
                anchors.leftMargin: 3

                Item {
                    id: strContainer
                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    Label {
                        id: strLabel
                        y: 4
                        text: "Strength"
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Slider {
                        id: strSlider
                        y: 1
                        height: 22
                        anchors.verticalCenterOffset: 0
                        anchors.right: strSpinner.left
                        anchors.rightMargin: 3
                        anchors.left: parent.left
                        anchors.leftMargin: 90
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    SpinBox {
                        id: strSpinner
                        x: 552
                        y: 0
                        width: 60
                        height: 22
                        anchors.right: parent.right
                        anchors.rightMargin: 3
                        anchors.verticalCenter: parent.verticalCenter
                        value: 2
                    }
                }

                Item {
                    id: dexContainer
                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    Label {
                        id: dexLabel
                        y: 4
                        text: "Dexterity"
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Slider {
                        id: dexSlider
                        y: 5
                        height: 22
                        anchors.right: dexSpinner.left
                        anchors.rightMargin: 3
                        anchors.left: parent.left
                        anchors.leftMargin: 90
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    SpinBox {
                        id: dexSpinner
                        x: 552
                        y: 0
                        width: 60
                        height: 22
                        anchors.right: parent.right
                        anchors.rightMargin: 3
                        anchors.verticalCenter: parent.verticalCenter
                        value: 2
                        onValueChanged: mainWindow.updateStats()
                    }
                }

                Item {
                    id: intContainer
                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    Label {
                        id: intLabel
                        y: 4
                        text: "Intelligence"
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Slider {
                        id: intSlider
                        y: 10
                        height: 22
                        anchors.right: intSpinner.left
                        anchors.rightMargin: 3
                        anchors.left: parent.left
                        anchors.leftMargin: 90
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    SpinBox {
                        id: intSpinner
                        x: 552
                        y: 0
                        width: 60
                        height: 22
                        anchors.right: parent.right
                        anchors.rightMargin: 3
                        anchors.verticalCenter: parent.verticalCenter
                        value: 1
                    }
                }

                Item {
                    id: chaContainer
                    width: 614
                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    Label {
                        id: chaLabel
                        y: 4
                        text: "Charisma"
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Slider {
                        id: chaSlider
                        y: 14
                        height: 22
                        anchors.right: chaSpinner.left
                        anchors.rightMargin: 3
                        anchors.left: parent.left
                        anchors.leftMargin: 90
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    SpinBox {
                        id: chaSpinner
                        x: 552
                        y: 0
                        width: 60
                        height: 22
                        anchors.right: parent.right
                        anchors.rightMargin: 3
                        anchors.verticalCenter: parent.verticalCenter
                        maximumValue: 9999
                        value: 1
                    }
                }
            }

            Item {
                id: apItem
                width: 162
                height: 31
                anchors.left: levelItem.right
                anchors.leftMargin: 3
                anchors.top: parent.top
                anchors.topMargin: 3

                Label {
                    id: apLabel
                    x: 8
                    y: 9
                    text: qsTr("Action Points")
                    font.bold: true
                }

                Text {
                    id: apStat
                    x: 102
                    y: 9
                    width: 29
                    height: 14
                    text: qsTr("0/0")
                    font.pixelSize: 12
                }
            }

        }

        GroupBox {
            id: effectsBox
            x: 2
            y: 208
            width: 636
            height: 227
            anchors.top: parent.top
            anchors.topMargin: 208
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            title: qsTr("Effects")

            Column {
                id: column1
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                spacing: 2
                Item {
                    id: maxHpItem
                    height: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0

                    Label {
                        text: qsTr("Max Health")
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Text {
                        id: text1
                        text: qsTr("1")
                        anchors.left: parent.left
                        anchors.leftMargin: 110
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 12
                    }
                }

                Item {
                    id: maxMpItem
                    height: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0

                    Label {
                        text: qsTr("Max Mana")
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Text {
                        id: manaVal
                        text: qsTr("1")
                        anchors.left: parent.left
                        anchors.leftMargin: 110
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 12
                    }
                }

                Item {
                    id: maxPetItem
                    height: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0

                    Label {
                        text: qsTr("Max Pet Level")
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Text {
                        id: maxPetVal
                        text: qsTr("1")
                        anchors.left: parent.left
                        anchors.leftMargin: 110
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 12
                    }
                }

                Item {
                    id: maxDamageItem
                    height: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0

                    Label {
                        text: qsTr("Max Damage")
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Text {
                        id: maxDamageVal
                        text: qsTr("1")
                        anchors.left: parent.left
                        anchors.leftMargin: 110
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 12
                    }
                }

                Item {
                    id: hitChanceItem
                    height: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0

                    Label {
                        text: qsTr("Hit Chance")
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Text {
                        id: hitChanceVal
                        text: qsTr("1")
                        anchors.left: parent.left
                        anchors.leftMargin: 110
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 12
                    }
                }

            }
        }
    }

}
