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
                onTriggered: aboutDialog.setVisible(true)
            }
        }
    }


    AboutDialog {
        id: aboutDialog
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

                    minimumValue: 1
                    maximumValue: 9999
                    value: 1
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

            ColumnLayout {
                id: statLayout
                height: 124
                anchors.top: levelItem.bottom
                anchors.topMargin: 3
                anchors.right: parent.right
                anchors.rightMargin: 3
                anchors.left: parent.left
                anchors.leftMargin: 3

                StatSlider {
                    id: strSlider

                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    name: "Strength"
                    value: 2
                    max: (levelSpinner.value * 6) + 2
                    min: 2
                }

                StatSlider {
                    id: dexSlider

                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    name: "Dexterity"
                    value: 2
                    max: (levelSpinner.value * 6) + 2
                    min: 2
                    //onValueChanged: mainWindow.updateStats()
                }

                StatSlider {
                    id: intSlider

                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    name: "Intelligence"
                    value: 1
                    max: (levelSpinner.value * 6) + 2
                    min: 1
                    //onValueChanged: mainWindow.updateStats()
                }

                StatSlider {
                    id: chaSlider

                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    name: "Charisma"
                    value: 1
                    max: (levelSpinner.value * 6) + 2
                    min: 1
                    //onValueChanged: mainWindow.updateStats()
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

                StatDisplay {
                    id: maxHpDisplay

                    name: "Max Health"
                    value: Util.calcMaxHealth(strSlider.value)
                }

                StatDisplay {
                    id: maxManaDisplay

                    name: "Max Mana"
                    value: Util.calcMaxMana(intSlider.value)
                }

                StatDisplay {
                    id: maxPetDisplay

                    name: "Max Pet Level"
                    value: Util.calcPetLevel(levelSpinner.value, chaSlider.value)
                }

                StatDisplay {
                    id: maxDamageDisplay

                    name: "Max Damage"
                    value: Util.calcMaxDamage(strSlider.value, dexSlider.value)
                }

                StatDisplay {
                    id: hitChanceDisplay

                    name: "Hit Chance"
                    value: Util.calcHitChance(dexSlider.value, levelSpinner.value)
                }
            }
        }
    }

}
