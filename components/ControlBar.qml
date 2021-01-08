import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

RowLayout {
    id: controlBtns

    readonly property Fonts fonts: Fonts{}
    readonly property PaletteColours colours: PaletteColours{}

    height: 40
    spacing: 20

    Repeater{
        id: repeater
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Layout.fillHeight: true
        Layout.fillWidth: true
        model: SystemControlsModel{}

        RoundButton{
            id: roundButton
            display: config.ShowSystemControlButtonLabels==="true"? AbstractButton.TextUnderIcon : AbstractButton.IconOnly
            icon.source: Qt.resolvedUrl(model.pathToIcon)
            icon.width: 40
            icon.height: 40
            icon.color: colours.strawYellow
            background: Rectangle {
                height: 50
                color: colours.transparent
                radius: 25
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                border.color: colours.transparent
                width: 50
            }
            Keys.onReturnPressed: clicked()
            Keys.onEnterPressed: clicked()
            onClicked: {
                if(model.name=== "Shutdown"){
                    sddm.powerOff();
                }
                if(model.name==="Restart"){
                    sddm.reboot();
                }
                if(model.name==="Suspend"){
                    sddm.suspend();
                }
                if(model.name==="Hibernate"){
                    sddm.hibernate();
                }
                if(model.name==="Hybrid Sleep"){
                    sddm.hybridSleep();
                }
            }

            Component.onCompleted: {
                if( config.ShowSystemControlButtonLabels==="true"){
                    Qt.createQmlObject(
                                "import QtQuick 2.12; Text {
                id: btnLabel;
                text: model.name;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: -btnLabel.height;
                font.family: fonts.pangolin.name;
                font.pointSize: 11;
                color: colours.strawYellow;
            }",
                                roundButton
                                );
                }
            }
        }
    }
}


