import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Item {
    id : homepage
    property var userId

    ListModel {
        id: listModel
        ListElement { name: "News"; page: "" }
        ListElement { name: "Search"; page: "SearchPage.qml" }
        ListElement { name: "Borrow"; page: "BorrowPage.qml" }
        ListElement { name: "Return"; page: "ReturnPage.qml" }
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
                onClicked: stackView.push(page,StackView.Immediate)
            }
        }
    }

    function setup() {
        header.welcomeText = "Welcome: Nguyen Quoc Khanh"
        funcBar.isLogin = true
        funcBar.adminBtnEnable = true
        funcBar.homeBtnEnable = false
        funcBar.backBtnEnable = false
        funcBar.logoutBtnEnable = true
        funcBar.setHomePage = "HomePage.qml"
    }

    Component.onCompleted: {
        console.log("User ID:", userId)
        setup()
    }
}
