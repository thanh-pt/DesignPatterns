import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    property alias name: id_name.text
    property alias text: id_textField.text
    Text {
        id: id_name
        anchors.verticalCenter: parent.verticalCenter
    }
    TextField {
        id: id_textField
        width: 60
        height: 30
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        selectByMouse: true
    }
}
