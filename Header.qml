import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    id: header
    height: 100
    anchors {
        left: parent.left
        top: parent.top
        right: parent.right
    }
    property alias welcomeText: welcomeTextId.text

    color: Qt.rgba(0,0,0,0.1)

    Image {
        id: logo
        width: 80
        height: 80
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 20
        }
        source: "qrc:/Items/logo.png"
    }

    Column{
        id : headerText
        anchors {
            left: logo.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        spacing: 15

        Text {
            id: libraryName
            font.pointSize: 20
            font.bold: true
            text: "Thư viện Đại học Quốc gia"
        }

        Text {
            id: welcomeTextId
            font.pointSize: 15
            text: welcomeText
        }
    }
}
