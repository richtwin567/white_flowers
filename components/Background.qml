import QtQuick 2.12

Image {
    id: backgroundImage
    anchors.fill: parent
    source: Qt.resolvedUrl("../assets/white_flowers.jpg")
    fillMode: Image.PreserveAspectCrop
    z: -5
}
