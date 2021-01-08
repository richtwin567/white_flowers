import QtQuick 2.12
import QtQuick.Controls 2.4

Button{
    id: loginBtn
    readonly property Fonts fonts: Fonts{}
    readonly property PaletteColours colours: PaletteColours{}

    text: "SIGN IN"
    rightPadding: 30
    leftPadding: 30

    font.family: fonts.pangolin.name
    font.pointSize: 20
    background: Rectangle{
        anchors.fill: parent
        color: colours.avocadoGreen
    }

    contentItem: Text {
        id: btnText
        text: loginBtn.text
        font.family: fonts.pangolin.name
        font.pointSize: 20
        color: colours.eggshellPeach
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
