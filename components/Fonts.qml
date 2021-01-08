import QtQuick 2.12

QtObject{
    readonly property FontLoader firamono: FontLoader{
        id: firamono
        source: "../assets/FiraMono-Regular.ttf"
    }

    readonly property FontLoader pangolin: FontLoader{
        id: pangolin
        source: "../assets/Pangolin-Regular.ttf"
    }

    readonly property FontLoader euphoria: FontLoader{
        id: euphoria
        source: "../assets/EuphoriaScript-Regular.ttf"
    }
}
