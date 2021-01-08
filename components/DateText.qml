import QtQuick 2.12


Column {
    id: column

    readonly property Fonts fonts: Fonts{}
    readonly property PaletteColours colours: PaletteColours{}

    property string weekday

    spacing: -18

    Text {
        id: weekday
        anchors.horizontalCenter: parent.horizontalCenter
        fontSizeMode: Text.FixedSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        z:2
        font.family:  fonts.euphoria.name
        font.pointSize: 44
        color: colours.avocadoGreen

        function update(){
            var d = new Date();
            text =Qt.formatDate(d,"dddd");
        }
    }

    Text {
        id: fulldate
        font.pointSize:14
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        z:1
        font.family: fonts.firamono.name
        color: colours.strawYellow

        function update(){
            const date =new Date();
            text=Qt.formatDate(date,"dd.MM.yyyy");

        }
    }

    Component.onCompleted: {
        fulldate.update();
        weekday.update();
    }

    Timer{
        id: dateTimer
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            fulldate.update();
            weekday.update();
        }
    }
}




/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
