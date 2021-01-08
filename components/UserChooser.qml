import QtQuick 2.12
import QtQuick.Controls 2.4

ComboBox{
    id: userComboBox

    readonly property Fonts fonts: Fonts{}
    readonly property PaletteColours colours: PaletteColours{}

    property string selectedUser: userComboBox.currentText.toLocaleLowerCase()

    model: userModel
    currentIndex: userModel.lastIndex
    textRole:"name"
    font.family: fonts.pangolin.name
    height: 40

    popup:  Popup {
        y: userComboBox.height
        width: userComboBox.width
        padding: 0

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: userComboBox.popup.visible ? userComboBox.delegateModel : null
            currentIndex: userComboBox.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

    }

    delegate: ItemDelegate{
        width: parent.width

        contentItem: Text {
            id: userDelegate
            text: model.name
            font.capitalization: Font.Capitalize
            font.family: fonts.pangolin.name
            color: colours.umberBrown
            font.pointSize: 18
        }

        background: Rectangle{
            anchors.fill: parent
            color: colours.eggshellPeach
            border.width: 0
            border.color: colours.transparent
        }
    }

    background: Rectangle{
        height: 3
        color: colours.strawYellow
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
    }

    contentItem:  Text {
        id: userSelected
        text: userComboBox.displayText
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.capitalization: Font.Capitalize
        font.family: fonts.pangolin.name
        color: colours.umberBrown
        font.pointSize: 20
    }

    indicator: Canvas{
        width:30
        height: 16
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 5
        contextType: "2d"
        onPaint: {
            context.reset();
            context.beginPath();
            context.moveTo(0, 0);
            context.lineTo((width-4) / 2, height-4);
            context.lineTo(width-4, 0);
            context.strokeStyle=colours.strawYellow;
            context.lineWidth = 3
            context.stroke();
        }
    }

    onCurrentIndexChanged: {
        selectedUser = currentText.toLowerCase();
    }

    onCurrentTextChanged: {
        selectedUser = currentText.toLowerCase();
    }

    Component.onCompleted: {
        selectedUser = userComboBox.currentText.toLowerCase();
    }
}


/*##^##
Designer {
    D{i:5;anchors_height:5}
}
##^##*/
