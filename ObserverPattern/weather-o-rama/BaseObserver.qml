import QtQuick 2.0
import QtQuick.Controls 2.0
import "qrc:/interface"

IObserver {
    id: id_BaseObserver
    property string name
    property bool registed: false
    property ISubject pSubject

    onUpdate: {
        id_BaseObserver.blinkColor()
    }

    MouseArea {
        anchors.fill: parent
        drag.target: parent
    }

    Text {
        id: id_name
        y: 5
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 14
        text: name
    }
    Button {
        width: 100
        height: 30
        x: 10
        y: 30
        text: registed ? "Unregister" : "Register"
        onClicked: {
            if (pSubject != undefined){
                if (registed == true){
                    pSubject.unRegister(id_BaseObserver)
                } else {
                    pSubject.register(id_BaseObserver)
                }
                registed = !registed
            }
        }
    }
}
