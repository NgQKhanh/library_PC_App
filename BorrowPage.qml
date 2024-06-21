import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Item {
    id: borrowPage
    Rectangle {
        id : searchPage
        width: parent.width - 40
        height: parent.height - 40
        anchors.centerIn: parent
        color: "lightgrey"
        border.color: "darkgrey"
        border.width: 2
        radius: 10

        Column {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10

            Rectangle {
                width: parent.width
                height: 50
                color: Qt.rgba(0,0,0,0)

                Text {
                    anchors{
                        left: parent.left
                        leftMargin: 40
                    }
                    font.pointSize: 20
                    font.bold: true
                    text: "Danh sách mượn: "
                    verticalAlignment: TextInput.AlignVCenter
                    Layout.preferredHeight: 50
                    Layout.preferredWidth: 400
                }

                FunctionButton {
                    anchors{
                        right: parent.right
                        rightMargin: 40
                    }
                    buttonText: "Hoàn tất"
                    onClicked: {
                        // Implement search functionality here
                        console.log("Search term:", searchField.text)
                        console.log("Search criteria:", searchCriteria.currentText)
                    }
                }
            }

            Rectangle {
                width: parent.width - 80
                height: parent.height - 100
                anchors.horizontalCenter: parent.horizontalCenter
                border.color: "grey"
                border.width: 1
                radius: 5

                ListView {
                    id: resultsList
                    width: parent.width
                    height: parent.height
                    clip: true
                    model: ListModel {
                        id: resultsModel
                        ListElement { title: "Title 1"; author: "Author 1"}
                        ListElement { title: "Title 2"; author: "Author 2"}
                        ListElement { title: "Title 3"; author: "Author 3"}
                        ListElement { title: "Title 4"; author: "Author 4"}
                        ListElement { title: "Title 5"; author: "Author 5"}
                        ListElement { title: "Title 6"; author: "Author 6"}
                        ListElement { title: "Title 7"; author: "Author 7"}
                        ListElement { title: "Title 8"; author: "Author 8"}
                        ListElement { title: "Title 9"; author: "Author 9"}
                        ListElement { title: "Title 10"; author: "Author 10"}
                        ListElement { title: "Title 11"; author: "Author 11"}
                        ListElement { title: "Title 12"; author: "Author 12"}
                    }

                    delegate: Item {
                        width: ListView.view.width
                        height: 80

                        Rectangle {
                            id : info
                            width: parent.width
                            height: parent.height
                            color: "white"
                            border.color: "grey"
                            border.width: 1
                            Column {
                                spacing: 5
                                anchors{
                                    left: parent.left
                                    leftMargin: 20
                                    verticalCenter: parent.verticalCenter
                                }
                                Text {
                                    text: model.title
                                    font.pointSize: 12
                                }
                                Text {
                                    text: model.author
                                    font.pointSize: 12
                                }
                            }
                            Image {
                                width: 40
                                height: 40
                                anchors {
                                    right: parent.right
                                    verticalCenter: parent.verticalCenter
                                    rightMargin: 30
                                }
                                source: "qrc:/Items/cancel_icon.jpg"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: console.log("Cancel: " + index)
                                }
                            }
                        }
                    }
                    ScrollBar.vertical: ScrollBar {
                        policy: ScrollBar.AlwaysOn
                    }
                }
            }
        }
    }

    function processUARTSignal(bookId){
        console.error("[BorrowPage]  UART received: " + bookId)
        // var xhr = new XMLHttpRequest();
        // var url = "http://localhost:3000/app/RFIDlogin";
        // xhr.open("POST", url);
        // xhr.setRequestHeader("Content-Type", "application/json");

        // xhr.onreadystatechange = function() {
        //     if (xhr.readyState === XMLHttpRequest.DONE) {
        //         if (xhr.status === 200) {
        //             var response = JSON.parse(xhr.responseText);
        //             console.log("[LoginPage] User login: ", response.username);
        //             stackView.push("HomePage.qml",{"userId": userId,"userName": response.username},StackView.Immediate)
        //         }
        //         else if (xhr.status === 400) {
        //             dialog.showDialog("Người dùng chưa đăng ký!")
        //             console.error("[LoginPage] Request failed with status: " + xhr.status);
        //         } else {
        //             dialog.showDialog("Có lỗi xảy ra: " + xhr.status)
        //             console.error("[LoginPage]  Request failed with status: " + xhr.status);
        //         }
        //     }
        // };
        // var sendData = JSON.stringify({ "userId": userId });
        // xhr.send(sendData);
    }

    function setup() {
        console.log("Nav => BorrowPage")
        header.welcomeText = def.borrowHeaderText
        funcBar.adminBtnEnable = false
        funcBar.homeBtnEnable = true
        funcBar.backBtnEnable = true
        funcBar.logoutBtnEnable = true
        funcBar.setHomePage = "HomePage.qml"
    }

    Component.onCompleted: {
        setup()
    }
}
