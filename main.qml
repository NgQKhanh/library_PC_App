import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs
import com.example.uartreader 1.0

Window {
    id : root
    visible: true
    width: 1024
    height: 680
    title: qsTr("Self Checkin")

    Definition{
        id: def
    }

    Image {
        id: background
        width: parent.width
        height: parent.height
        source: "qrc:/Items/background.PNG"
    }

    Header{
        id : header
        welcomeText : "Quẹt thẻ để đăng nhập"
        libraryName: "Thư viện Đại Học FKFNKJDBVKJD"
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

            function handleUARTSignal(data) {
                var currentQMLItem = stackView.currentItem;
                if (currentQMLItem && typeof currentQMLItem.processUARTSignal === "function") {
                    currentQMLItem.processUARTSignal(data);
                }
            }
        }
    }

    FunctionBar {
        id: funcBar
        onBackClick : {
            stackView.pop(StackView.Immediate)
            stackView.currentItem.setup()
        }
    }

    MessageDialog {
        id: announcement
        title: "Thông báo"
        buttons: MessageDialog.Close
        text: annText
        property string annText

        function show(text){
            announcement.annText = text
            announcement.open()
        }
    }

    UartReader {
        id: uartReader
        portName: "COM3"
        baudRate: 115200
        onDataReceived: {
            stackView.handleUARTSignal(data)
        }
    }

    Component.onCompleted: {
        uartReader.openPort()
    }
}
