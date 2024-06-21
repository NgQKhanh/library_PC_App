import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import com.example.uartreader 1.0

Item {

    UartReader {
            id: uartReader
            portName: "COM3"
            baudRate: 9600
            onDataReceived: {
                if(data == "1") {
                    stackView.push("HomePage.qml",{"userId": "1"},StackView.Immediate)
                }
            }
        }
    ListModel {
        id: listModel
        ListElement { name: "News"; page: "HomePage.qml"; icon: "qrc:/Items/news_icon.png" }
        ListElement { name: "Search"; page: "SearchPage.qml"; icon: "qrc:/Items/search_icon.png" }
    }

    GridView {
        id: gridView
        width: parent.width - 50
        height: parent.height - 50
        anchors.centerIn: parent
        model: listModel
        cellHeight: gridView.height/2
        cellWidth: gridView.width/2
        delegate: delegate
    }

    Component {
        id : delegate
        Item{
            height: gridView.height/2
            width: gridView.width/2
            HomePageBigButton{
                height: parent.height - 50
                width: parent.width - 50
                anchors.centerIn: parent
                buttonText: name
                imageSource: icon
                onClicked: stackView.push(page,{"userId": "1"},StackView.Immediate)
            }
        }
    }

    function setup() {
        header.welcomeText = "Scan to login"
        funcBar.isLogin = false
        funcBar.adminBtnEnable = true
        funcBar.homeBtnEnable = false
        funcBar.backBtnEnable = false
        funcBar.logoutBtnEnable = false
    }

    Component.onCompleted: {
        setup()
    }
}
