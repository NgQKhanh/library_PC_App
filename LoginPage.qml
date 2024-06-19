import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import com.example.uartreader 1.0

Item {
    Component.onCompleted: {
        funcBar.adminBtnEnable = true
        funcBar.funcBtnEnable = false
        header.welcomeText = "Scan to login"
        uartReader.openPort()
    }

    UartReader {
            id: uartReader
            portName: "COM3"
            baudRate: 9600
            onDataReceived: {
                if(data == "code5") {
                    mainLoader.source = "HomePage.qml"
                }
            }
        }

    ListModel {
        id: listModel
        ListElement { name: "News"; page: "HomePage.qml" }
        ListElement { name: "Search"; page: "SearchPage.qml" }
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
