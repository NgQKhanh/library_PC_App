import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Item {
    Rectangle {
        id : helpPage
        width: parent.width - 40
        height: parent.height - 40
        anchors.centerIn: parent
        radius: 10
        Image {
            id: helpImg
            anchors.centerIn: parent
            width: parent.width - 120
            height: parent.height - 40
            source: "qrc:/Items/help.png"
        }
    }

    function setup() {
        console.log("Nav => NewsPage")
        header.welcomeText = qsTr("Trợ giúp")
        funcBar.adminBtnEnable = false
        funcBar.homeBtnEnable = false
        funcBar.helpBtnEnable = false
        funcBar.backBtnEnable = true

        if(true === funcBar.isLogin){
            funcBar.logoutBtnEnable = true
            funcBar.setHomePage = "HomePage.qml"
        } else {
            funcBar.logoutBtnEnable = false
            funcBar.setHomePage = "LoginPage.qml"
        }
    }

    Component.onCompleted: {
        setup()
    }
}
