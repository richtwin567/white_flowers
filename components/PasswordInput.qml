import QtQuick 2.12
import QtQuick.Controls 2.4

TextField{
    id: passwordField

    readonly property Fonts fonts: Fonts{}
    readonly property PaletteColours colours: PaletteColours{}

    property bool loginFailed

    renderType: Text.QtRendering
    horizontalAlignment: Text.AlignHCenter
    placeholderText: "Password"
    placeholderTextColor: colours.mossGreen
    font.family: fonts.pangolin.name
    font.pointSize: 20
    color: colours.umberBrown
    echoMode: TextInput.Password
    passwordCharacter: "•"
    passwordMaskDelay: 500

    background: Rectangle{
        id: fieldBackground
        height: 3
        color: colours.strawYellow
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

    }


    states: [
        State {
            name: "incorrect"
            when: passwordField.loginFailed

            PropertyChanges {
                target: fieldBackground
                color: colours.roseRed
            }
        }
    ]
    transitions: [

        Transition {
            id: transition
            reversible: true
            from: "*"
            to: "*"

            ColorAnimation {
                target: fieldBackground
                duration: 100
            }

        }
    ]


}
