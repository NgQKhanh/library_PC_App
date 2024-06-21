import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id : searchPage
        width: parent.width - 40
        height: parent.height - 40
        anchors.centerIn: parent
        radius: 10
    }

    function setup() {
        console.log("Nav => SearchDetailPage")
        header.welcomeText = def.searchDetailHeaderText
        funcBar.adminBtnEnable = false
        funcBar.homeBtnEnable = true
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
