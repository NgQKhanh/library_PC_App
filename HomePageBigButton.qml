import QtQuick
import QtQuick.Layouts

Rectangle {
    id: hpbutton
    width: parent.width
    height: parent.height
    radius: 15

    property alias buttonText: buttonTextId.text
    signal clicked()

    gradient: Gradient {
        GradientStop { position: 0; color: "white" }
        GradientStop { position: 1; color: "#B9A9A9" }
    }

    border{
        color: "#888888"
        width: 2
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

