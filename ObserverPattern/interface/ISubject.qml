import QtQuick 2.0
import "qrc:/interface"

Rectangle {
    color: "#3498db"
    border.width: 1

    signal register(IObserver _iObserver)
    signal unRegister(IObserver _iObserver)
}
