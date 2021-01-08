import "components"

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: container

    property bool loginFailed

    anchors.fill: parent

    ColumnLayout {
        id: columnLayout
        anchors.fill: mainPanel

        Column{
            id: clockAndDate
            spacing: 30
            Layout.topMargin: 15
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            Clock{
                anchors.horizontalCenter: parent.horizontalCenter
                size:columnLayout.width *0.7
            }

            DateText{
                anchors.horizontalCenter: parent.horizontalCenter;
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop }
        }

        ColumnLayout{
            id: loginForm
            Layout.bottomMargin: 25
            spacing: 30
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.preferredWidth: parent.width

            UserChooser{
                id: userChooser
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredWidth:  parent.width *0.7

            }

            PasswordInput{
                id: passwordField
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredWidth: parent.width *0.7
                loginFailed: container.loginFailed
                Keys.onEnterPressed: container.login()
                Keys.onReturnPressed: container.login()
            }

            LoginButton{
                id:loginBtn
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: container.login();
                Keys.onEnterPressed: container.login();
                Keys.onReturnPressed: container.login();
            }
        }
    }

    ControlBar{
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 10
    }

    Panel{
        id: mainPanel
        width: parent.width * 0.35
        height: parent.height
    }

    Background{}

    function login(){
        var user = userChooser.selectedUser
        var pass = passwordField.text;

        sddm.login(user,pass,sessionModel.lastIndex);
    }

    Connections {
        target: sddm
        onLoginSucceeded: {
        }
        onLoginFailed: {
            container.loginFailed = true
            if(resetError.running){
                resetError.stop();
                resetError.start();
            }else{
                resetError.start();
            }
        }
    }

    Timer {
        id: resetError
        interval: 4000
        onTriggered: container.loginFailed = false
        running: false
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:100;anchors_width:100}
}
##^##*/
