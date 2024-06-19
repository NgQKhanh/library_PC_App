import QtQuick 2.15
import QtQuick.Controls 2.15
import com.example.uartreader 1.0

Rectangle {
    visible: true
    width: 640
    height: 480

    UartReader {
            id: uartReader
            portName: portComboBox.currentText
            baudRate: 9600
            onDataReceived: {
                receivedDataTextEdit.text = data
            }
        }

        Column {
            spacing: 10
            anchors.centerIn: parent

            ComboBox {
                id: portComboBox
                width: parent.width
                model: uartReader.availablePorts
                onCurrentTextChanged: {
                    uartReader.portName = currentText
                    uartReader.openPort()
                }
            }

            TextEdit {
                id: receivedDataTextEdit
                width: parent.width
                height: 200
                readOnly: true
            }

            Row {
                spacing: 10

                Button {
                    text: "Open Port"
                    onClicked: uartReader.openPort()
                }

                Button {
                    text: "Close Port"
                    onClicked: uartReader.closePort()
                }
            }
        }
    }
