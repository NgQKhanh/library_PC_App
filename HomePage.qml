import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Item {
    Component.onCompleted: {
        header.welcomeText = "Welcome: Nguyen Quoc Khanh"
        funcBar.adminBtnEnable = true
        funcBar.funcBtnEnable = true
    }

    ListModel {
        id: listModel
        ListElement { name: "News"; page: "" }
        ListElement { name: "Search"; page: "SearchPage.qml" }
        ListElement { name: "Borrow"; page: "" }
        ListElement { name: "Return"; page: "" }
    }

    GridView {
        id: gridView
        anchors.fill: parent
        model: listModel
        cellHeight: 240
        cellWidth: 240
        delegate: Rectangle {
            width: 200
            height: 200
            color: "grey"
            radius: 5
            Text {
                color: "white"
                text: name
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: mainLoader.source = page
            }
        }
    }
}
