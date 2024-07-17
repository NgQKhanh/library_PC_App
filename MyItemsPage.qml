import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Item {
    id: myItemsPage

    ListModel {
        id : bList
        // ListElement { title: "Giải tích 1"; borrowDate: "20-01-2024"; dueDate: "20-02-2024" }
        // ListElement { title: "Đại số tuyến tính"; borrowDate: "25-01-2024"; dueDate: "25-02-2024" }
        // ListElement { title: "Tin học đại cương"; borrowDate: "26-01-2024"; dueDate: "26-02-2024" }
    }

    ListModel {
        id : rsvnList
        // ListElement { seat: "Bàn 1 Ghế 1"; room: "201"; shift: "1"; date: "27-01-2024"}
        // ListElement { seat: "Bàn 1 Ghế 1"; room: "201"; shift: "1"; date: "28-01-2024"}
    }

    Rectangle {
        id : searchPage
        width: parent.width - 40
        height: parent.height - 40
        anchors.centerIn: parent
        radius: 10

        Column {
            width: parent.width - 100
            height: parent.height - 100
            anchors.centerIn: parent

            Rectangle{
                width: parent.width
                height: 70
                RowLayout {
                    spacing: 20
                    FunctionButton {
                        buttonText: qsTr("Danh sách mượn")
                        onClicked: {
                            showList.visible = true;
                            rsvnInfo.visible = false;
                        }
                    }
                    FunctionButton {
                        buttonText: qsTr("Thông tin đặt chỗ")
                        onClicked: {
                            showList.visible = false;
                            rsvnInfo.visible = true;
                        }
                    }
                }
            }
            Rectangle{
                width: parent.width
                height: parent.height - 70
                color: "green"
                Rectangle{
                    id : showList
                    width: parent.width
                    height: parent.height
                    visible: true
                    Column{
                        width: parent.width
                        height: parent.height
                        spacing: 0

                        Row{
                            width: parent.width
                            height: 50
                            Rectangle {
                                id : col1
                                width: parent.width / 2 + 80
                                height: 50
                                color: "lightblue"
                                border.color: "grey"
                                border.width: 1
                                Text {
                                    text: qsTr("Tên sách")
                                    font.bold: true
                                    font.pointSize: 12
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle {
                                id : col2
                                width: parent.width / 4 - 40
                                height: 50
                                color: "lightblue"
                                border.color: "grey"
                                border.width: 1
                                Text {
                                    text: qsTr("Ngày mượn")
                                    font.bold: true
                                    font.pointSize: 12
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle {
                                id : col3
                                width: parent.width / 4 - 40
                                height: 50
                                color: "lightblue"
                                border.color: "grey"
                                border.width: 1
                                Text {
                                    text: qsTr("Hạn trả")
                                    font.bold: true
                                    font.pointSize: 12
                                    anchors.centerIn: parent
                                }
                            }
                        }

                        Rectangle {
                            id : dataShow
                            width: parent.width
                            height: parent.height - 50
                            color: "lightgray"
                            border.color: "grey"
                            border.width: 1
                            radius: 5

                            ListView {
                                id: resultsList
                                width: parent.width
                                height: parent.height
                                clip: true
                                model: bList

                                delegate: Item {
                                    width: ListView.view.width
                                    height: 50

                                    Rectangle {
                                        id : title
                                        width: parent.width/2 + 80
                                        height: parent.height
                                        anchors{
                                            left: parent.left
                                            top: parent.top
                                        }
                                        color: "white"
                                        border.color: "grey"
                                        border.width: 1
                                        Text {
                                            text: model.title
                                            font.pointSize: 12
                                            anchors.centerIn: parent
                                        }
                                    }

                                    Rectangle {
                                        id : bDate
                                        width: parent.width/4 - 40
                                        height: parent.height
                                        anchors{
                                            left: title.right
                                            top: parent.top
                                        }
                                        color: "white"
                                        border.color: "grey"
                                        border.width: 1
                                        Text {
                                            text: model.borrowDate
                                            font.pointSize: 12
                                            anchors.centerIn: parent
                                        }
                                    }

                                    Rectangle {
                                        id : dueDate
                                        width: parent.width/4 - 40
                                        height: parent.height
                                        anchors{
                                            left: bDate.right
                                            top: parent.top
                                        }
                                        color: "white"
                                        border.color: "grey"
                                        border.width: 1
                                        Text {
                                            text: model.dueDate
                                            font.pointSize: 12
                                            anchors.centerIn: parent
                                            color: model.status === "overdue" ? "red" : "black"
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

                Rectangle{
                    id :rsvnInfo
                    width: parent.width
                    height: parent.height
                    visible: false

                    Column{
                        width: parent.width
                        height: parent.height
                        spacing: 0

                        Row{
                            width: parent.width
                            height: 50
                            Rectangle {
                                width: parent.width / 4
                                height: 50
                                color: "lightblue"
                                border.color: "grey"
                                border.width: 1
                                Text {
                                    text: qsTr("Chỗ ngồi")
                                    font.bold: true
                                    font.pointSize: 12
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle {
                                width: parent.width / 4
                                height: 50
                                color: "lightblue"
                                border.color: "grey"
                                border.width: 1
                                Text {
                                    text: qsTr("Phòng")
                                    font.bold: true
                                    font.pointSize: 12
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle {
                                width: parent.width / 4
                                height: 50
                                color: "lightblue"
                                border.color: "grey"
                                border.width: 1
                                Text {
                                    text: qsTr("Kíp")
                                    font.bold: true
                                    font.pointSize: 12
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle {
                                width: parent.width / 4
                                height: 50
                                color: "lightblue"
                                border.color: "grey"
                                border.width: 1
                                Text {
                                    text: qsTr("Ngày")
                                    font.bold: true
                                    font.pointSize: 12
                                    anchors.centerIn: parent
                                }
                            }
                        }

                        Rectangle {
                            width: parent.width
                            height: parent.height - 50
                            color: "lightgray"
                            border.color: "grey"
                            border.width: 1
                            radius: 5

                            ListView {
                                width: parent.width
                                height: parent.height
                                clip: true
                                model: rsvnList

                                delegate: Item {
                                    width: ListView.view.width
                                    height: 50

                                    Rectangle {
                                        id : seat
                                        width: parent.width/4
                                        height: parent.height
                                        anchors{
                                            left: parent.left
                                            top: parent.top
                                        }
                                        color: "white"
                                        border.color: "grey"
                                        border.width: 1
                                        Text {
                                            text: model.seat
                                            font.pointSize: 12
                                            anchors.centerIn: parent
                                        }
                                    }

                                    Rectangle {
                                        id : room
                                        width: parent.width/4
                                        height: parent.height
                                        anchors{
                                            left: seat.right
                                            top: parent.top
                                        }
                                        color: "white"
                                        border.color: "grey"
                                        border.width: 1
                                        Text {
                                            text: model.room
                                            font.pointSize: 12
                                            anchors.centerIn: parent
                                        }
                                    }

                                    Rectangle {
                                        id : shift
                                        width: parent.width/4
                                        height: parent.height
                                        anchors{
                                            left: room.right
                                            top: parent.top
                                        }
                                        color: "white"
                                        border.color: "grey"
                                        border.width: 1
                                        Text {
                                            text: model.shift
                                            font.pointSize: 12
                                            anchors.centerIn: parent
                                        }
                                    }

                                    Rectangle {
                                        id : date
                                        width: parent.width/4
                                        height: parent.height
                                        anchors{
                                            left: shift.right
                                            top: parent.top
                                        }
                                        color: "white"
                                        border.color: "grey"
                                        border.width: 1
                                        Text {
                                            text: model.date
                                            font.pointSize: 12
                                            anchors.centerIn: parent
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
            }
        }
    }

    function getBorrowBookList(userID){
        var xhr = new XMLHttpRequest();
        var url = common.baseUrl + common.getBBListUrl+ "?userID="+userID;
        xhr.open("GET", url);
        xhr.setRequestHeader("Content-Type", "application/json");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    var borrowedBooks = response.borrowedBookList;

                    for (var i = 0; i < borrowedBooks.length; i++) {
                        var book = borrowedBooks[i];
                        var currentDate = new Date();
                        var dueDate = new Date(book.dueDate);
                        var status = "normal"

                        if(currentDate > dueDate) {
                            status = "overdue"
                            console.log("over")
                        }

                        bList.append({
                            title: book.bookName,
                            borrowDate: book.borrowDate,
                            dueDate: book.dueDate,
                            status: status
                        });
                    }
                }
                else if (xhr.status === 404) {
                    console.error("[myItem] Not found! ");
                } else {
                    announcement.show("Có lỗi xảy ra: " + xhr.status)
                    console.error("[myItem] Request failed with status: " + xhr.status);
                }
            }
        };
        xhr.send();
    }

    function getSeatRsvn(userID){
        var xhr = new XMLHttpRequest();
        var url = common.baseUrl + common.getSeatRsvnUrl+ "?userID="+userID;
        xhr.open("GET", url);
        xhr.setRequestHeader("Content-Type", "application/json");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    var seats = response.uSeats;

                    for (var i = 0; i < seats.length; i++) {
                        var seat = seats[i];
                        rsvnList.append({
                            seat: seatCode(seat.seat),
                            shift: seat.shift,
                            room: seat.room,
                            date: seat.date
                        });
                    }
                }
                else if (xhr.status === 404) {
                    console.error("[myItem] Not found! ");
                } else {
                    announcement.show("Có lỗi xảy ra: " + xhr.status)
                    console.error("[myItem] Request failed with status: " + xhr.status);
                }
            }
        };
        xhr.send();
    }

    function seatCode(code){
        var chair = code%100;
        var table = (code - chair)/100;
        return "Bàn " + table + " Ghế " + chair;
    }

    function setup() {
        console.log("Nav => MyItemsPage")
        header.welcomeText = qsTr("Của tôi")
        funcBar.adminBtnEnable = false
        funcBar.homeBtnEnable = false
        funcBar.backBtnEnable = true

        if(true === funcBar.isLogin){
            funcBar.logoutBtnEnable = true
            funcBar.setHomePage = "HomePage.qml"
        } else {
            funcBar.logoutBtnEnable = false
            funcBar.setHomePage = "LoginPage.qml"
        }

        // getBorrowBookList("1")
        // getSeatRsvn("1")
        getBorrowBookList(common.userID)
        getSeatRsvn(common.userID)
    }

    Component.onCompleted: {
        setup()
    }
}
