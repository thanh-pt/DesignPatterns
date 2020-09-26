import QtQuick 2.0
import QtQuick.Controls 2.0
import "qrc:/interface"
import "qrc:/Component"

ISubject {
    id: id_weatherData
    /// Property
    property var listObserver: []

    /// Inherits implementation
    onRegister: {
        listObserver.push(_iObserver)
        id_notifer.displayNotify(_iObserver.name + " registed 👍")
    }

    onUnRegister: {
        var observerIdx = listObserver.indexOf(_iObserver)
        while (observerIdx !== -1){
            listObserver.splice(observerIdx, 1)
            observerIdx = listObserver.indexOf(_iObserver)
        }
        id_notifer.displayNotify(_iObserver.name + " unregisted 😢")
    }

    /// function
    function getTemperature(){
        return parseInt(id_tempurature.text)
    }
    function getHumidity(){
        return parseInt(id_humidity.text)
    }
    function getPressure(){
        return parseInt(id_pressure.text)
    }


    /// Component
    MouseArea {
        anchors.fill: parent
        drag.target: parent
    }
    Column {
        spacing: 5
        width: parent.width - 10
        x: 5
        y: 10
        Text {
            text: "Weather Data"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
        }
        TextFieldLable {
            id: id_tempurature
            width: parent.width
            height: 30
            y: 20
            name: "Tempurature:"
        }
        TextFieldLable {
            id: id_humidity
            width: parent.width
            height: 30
            y: 20
            name: "Humidity:"
        }
        TextFieldLable {
            id: id_pressure
            width: parent.width
            height: 30
            y: 20
            name: "Pressure:"
        }
        Button {
            text: "Update"
            onClicked: {
                for (var i=0; i < listObserver.length; i++){
                    listObserver[i].update(id_weatherData)
                }
            }
        }
    }

    Text {
        id: id_notifer
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        opacity: 0
        function displayNotify(_text){
            id_notifer.text = _text
            id_displayNotification.restart()
        }

        SequentialAnimation {
            id: id_displayNotification
            PropertyAnimation {
                target: id_notifer
                property: "opacity"
                from: 0
                to: 1
                duration: 300
            }
            PauseAnimation {
                duration: 200
            }
            PropertyAnimation {
                target: id_notifer
                property: "opacity"
                from: 1
                to: 0
                duration: 300
            }
        }
    }
}
