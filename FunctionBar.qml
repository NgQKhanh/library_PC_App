import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: funcBar
    height: 50
    anchors {
        left: parent.left
        leftMargin: 10
        bottom: parent.bottom
        bottomMargin: 10
        right: parent.right
    }
    property string previousPage
    property bool adminBtnEnable
    property bool funcBtnEnable

    color: Qt.rgba(0,0,0,0)

    RowLayout {
        id: buttonRow
        visible: funcBtnEnable
        height: funcBar.height
        width: backBtn.width*3+9
        spacing: 3
        anchors {
            left: funcBar.left
            top: funcBar.top
        }

        FunctionButton{
            id: logoutBtn
            buttonText: "Logout"
            onClicked: {
                onClicked: mainLoader.source = "LoginPage.qml"
            }
        }

        Rectangle {
            width: 2
            height: 50
            color: "#888888"
        }

        FunctionButton{
            id: homeBtn
            buttonText: "Home"
            onClicked: {
                onClicked: mainLoader.source = "HomePage.qml"
            }
        }

        FunctionButton{
            id: backBtn
            buttonText: "Back"
            onClicked: {
                onClicked: mainLoader.source = previousPage
            }
        }
    }

    FunctionButton{
        id: adminBtn
        buttonText: "Admin"
        visible: adminBtnEnable
        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: 10
        }
        onClicked: {
            onClicked: mainLoader.source = "AdminPage.qml"
        }
    }
}
