import QtQuick 2.12

Rectangle{

    readonly property PaletteColours colours: PaletteColours{}

    opacity: 0.9
    z: -2
    gradient: Gradient{

        GradientStop{
            color: colours.white
            position: 0.5
        }
        GradientStop{
            color: colours.transparent
            position: 1.0
        }

        orientation: Gradient.Horizontal
    }
}
