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
        anchors.fill: root
        source: "qrc:/Items/background.jpg"
    }

    Header{
        id : header
        welcomeText : "Scan to login"
    }

    Loader{
        id : mainLoader
        anchors{
            left: parent.left
            right: parent.right
            top: header.bottom
            bottom: funcBar.top
        }
        source: "StackViewPage.qml"
    }

    FunctionBar {
        id: funcBar
    }
}
