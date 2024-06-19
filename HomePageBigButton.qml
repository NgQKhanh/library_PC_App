import QtQuick
import QtQuick.Layouts

Rectangle {
    id: hpbutton
    width: 300
    height: 150
    Layout.fillHeight: true
    Layout.fillWidth: true
    color: "yellow"
    radius: 15
    border.color: "darkgray"
    border.width: 2
    property alias buttonText: buttonTextId.text
    signal clicked()

    gradient: Gradient {
        GradientStop { position: 0.0; color: "lightyellow" }
        GradientStop { position: 1.0; color: "gold" }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            hpbutton.clicked()
        }
    }

    Text {
        id: buttonTextId
        text: buttonText
        anchors.centerIn: parent
        font.bold: true
        font.pointSize: 20
        color: "black"
    }
}

