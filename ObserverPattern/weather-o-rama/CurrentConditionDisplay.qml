import QtQuick 2.0

BaseObserver {
    name: "Current Condition"
    property string temperature
    property string humidity
    property string pressure

    onUpdate: {
        temperature = _iSubject.getTemperature()
        humidity    = _iSubject.getHumidity()
        pressure    = _iSubject.getPressure()
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        x: 5
        text: "T: " + temperature + " - H: " + humidity + " - P: " + pressure
    }
}
