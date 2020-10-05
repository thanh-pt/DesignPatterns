import QtQuick 2.12
import QtQuick.Window 2.12

import "Duck"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    DecoyDuck {
        Component.onCompleted: performQuack()
    }
}
