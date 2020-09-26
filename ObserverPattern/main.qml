import QtQuick 2.12
import QtQuick.Window 2.12
import "qrc:/weather-o-rama"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    WeatherData {
        id: id_weatherData
        width: 200
        height: 300
    }

    CurrentConditionDisplay {
        width: 200
        height: 100
        x: parent.width - width
        pSubject: id_weatherData
    }

    ForecastDisplay {
        width: 200
        height: 100
        x: parent.width - width
        y: 100
        pSubject: id_weatherData
    }

    StatisticsDisplay {
        width: 200
        height: 100
        x: parent.width - width
        y: 200
        pSubject: id_weatherData
    }
}
