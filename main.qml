import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id : root
    visible: true
    width: 1024
    height: 680
    title: qsTr("Self Checkin")

    Image {
        id: background
        width: parent.width
        height: parent.height
        source: "qrc:/Items/background.PNG"
    }

    Header{
        id : header
        welcomeText : "Scan to login"
        libraryName: "Thư viện Đại học BCKABSCKH"
    }

    Rectangle{
        id : mainLoader
        color: Qt.rgba(0,0,0,0)
        anchors{
            left: parent.left
            right: parent.right
            top: header.bottom
            bottom: funcBar.top
        }
        StackView {
            id: stackView
            anchors.fill: parent
            initialItem: "LoginPage.qml"
        }
    }

    FunctionBar {
        id: funcBar
        onBackClick : {
            stackView.pop(StackView.Immediate)
            stackView.currentItem.setup()
        }
    }
}
