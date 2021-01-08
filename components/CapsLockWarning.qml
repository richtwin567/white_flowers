import QtQuick 2.0

Text {
    id: warning

    readonly property Fonts fonts: Fonts{}
    readonly property PaletteColours colours: PaletteColours{}

    property bool isOn

    text: "Caps Lock is on"
    opacity: 0
    font.family: fonts.pangolin.name
    font.pointSize: 12
    color: colours.avocadoGreen

    states: [
        State {
            name: "on"
            when: warning.isOn

            PropertyChanges {
                target: warning
                opacity: 1
            }
        }
    ]



}
