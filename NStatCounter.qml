import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.0

import "utilities.js" as Util

ApplicationWindow {
    id: mainWindow
    title: "NStatCounter"
    width: 400
    height: 450
    minimumWidth: 400
    minimumHeight: 375
    visible: true

    property alias level: levelSpinner.value

    property alias strength: strSlider.value
    property alias dexterity: dexSlider.value
    property alias intelligence: intSlider.value
    property alias charisma: chaSlider.value

    property int ap: level*6
    property int usedAp: strength + dexterity + intelligence + charisma - 6 // 6 is the total AP already assigned at creation
    property bool usedAllAp: (usedAp < ap)
    property int remainingAp: ap - usedAp

    onLevelChanged: {
        // Can't use the ap prop because it depends on level
        var diff = (level*6) - (strength + dexterity + intelligence + charisma - 6);
        // Only matters when more than the available ap is used
        if(diff >= 0 || !strSlider) {
            return;
        }

        // Reduce stats until there is no diff (an expensive operation!)
        var iterator = 0;
        var strOk = true,
            dexOk = true,
            intOk = true,
            chaOk = true;
        for(; diff < 0; diff++) {
            if(strOk && strSlider.value <= strSlider.min) {
                strOk = false;
            }
            if(dexOk && dexSlider.value <= dexSlider.min) {
                dexOk = false;
            }
            if(intOk && intSlider.value <= intSlider.min) {
                intOk = false;
            }
            if(chaOk && chaSlider.value <= chaSlider.min) {
                chaOk = false;
            }

            if(iterator == 0) {
                    iterator++;
                if(strOk) {
                    strSlider.value--;
                    continue;
                }
            }

            if(iterator == 1) {
                iterator++;
                if(dexOk) {
                    dexSlider.value--;
                    continue;
                }
            }

            if(iterator == 2) {
                iterator++;
                if(intOk) {
                    intSlider.value--;
                    continue;
                }
            }

            if(iterator == 3) {
                iterator = 0;
                if(chaOk) {
                    chaSlider.value--;
                    continue;
                } else {
                    // Note that we need to go through again to make the value propagate
                    diff--;
                }

            }
        }
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

            title: "Stats"

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

            ActionPointBox {
                id: apItem
                width: 162
                height: 31
                anchors.left: levelItem.right
                anchors.leftMargin: 3
                anchors.top: parent.top
                anchors.topMargin: 3

                usedAP: mainWindow.usedAp
                totalAP: mainWindow.ap
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
                    max: mainWindow.ap + 2
                    min: 2
                    value: 2
                    remainingValues: mainWindow.remainingAp
                }

                StatSlider {
                    id: dexSlider

                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    name: "Dexterity"
                    max: mainWindow.ap + 2
                    min: 2
                    value: 2
                    remainingValues: mainWindow.remainingAp
                }

                StatSlider {
                    id: intSlider

                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    name: "Intelligence"
                    max: mainWindow.ap + 1
                    min: 1
                    value: 1
                    remainingValues: mainWindow.remainingAp
                }

                StatSlider {
                    id: chaSlider

                    height: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    name: "Charisma"
                    max: mainWindow.ap + 1
                    min: 1
                    value: 1
                    remainingValues: mainWindow.remainingAp
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
                    value: Util.calcHitChance(dexSlider.value, levelSpinner.value)+"%"
                }
            }
        }
    }

}
