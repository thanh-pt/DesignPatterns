import QtQuick 2.0
import "qrc:/interface"

Rectangle {
    id: id_iObserver
    readonly property string color1: "#2ecc71"
    readonly property string color2: "#e67e22"
    color: color1
    border.width: 1

    signal update(Item _iSubject)

    function blinkColor(){
        id_blinkColor.restart()
    }

    SequentialAnimation {
        id: id_blinkColor
        PropertyAnimation {
            target: id_iObserver
            property: "color"
            from: color1
            to: color2
            duration: 300
        }
        PropertyAnimation {
            target: id_iObserver
            property: "color"
            from: color2
            to: color1
            duration: 200
        }
    }
}
