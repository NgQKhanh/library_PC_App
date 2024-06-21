import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Item {
    width: parent.width
    height: parent.height
    Rectangle {
        id : searchPage
        width: parent.width - 40
        height: parent.height - 40
        anchors.centerIn: parent
        radius: 10
        color: "lightgrey"
        border.color: "darkgrey"
        border.width: 2

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10

            RowLayout {
                spacing: 10
                Layout.alignment: Qt.AlignHCenter

                TextField {
                    id: searchField
                    font.pointSize: 12
                    placeholderText: "Enter key word"
                    verticalAlignment: TextInput.AlignVCenter
                    leftPadding: 24
                    Layout.preferredHeight: 50
                    Layout.preferredWidth: 400
                }

                ComboBox {
                    id: searchCriteria
                    font.pointSize: 12
                    leftPadding: 24
                    model: ["Title", "Author", "Category", "Publisher"]
                    Layout.preferredWidth: 150
                    Layout.preferredHeight: 50
                    delegate: ItemDelegate {
                        width: 150
                        height: 40
                        Text {
                            leftPadding: 24
                            anchors.verticalCenter: parent.verticalCenter
                            text: modelData
                            font.pointSize: 12
                        }
                        background: Rectangle {
                            border.color: "#ccc"
                            border.width: 1
                        }
                    }
                }

                FunctionButton {
                    id : btnSearch
                    buttonText: "Search"
                    onClicked: {
                        // Implement search functionality here
                        console.log("Search term:", searchField.text)
                        console.log("Search criteria:", searchCriteria.currentText)
                    }
                }
            }

            Rectangle {
                id : dataShow
                width: parent.width - 200
                height: parent.height - 100
                Layout.alignment: Qt.AlignHCenter
                border.color: "grey"
                border.width: 3
                radius: 5

                ListView {
                    id: resultsList
                    width: parent.width - 6
                    height: parent.height - 6
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
                            anchors{
                                left: parent.left
                                leftMargin: 3
                                top: parent.top
                                topMargin: 3
                            }
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
                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Select: " + model.title + " " + model.author)
                                    stackView.push("SearchDetailPage.qml",StackView.Immediate)
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

    function setup() {
        header.welcomeText = "Search Document"
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
