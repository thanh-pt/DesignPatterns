import QtQuick 2.0

BaseObserver {
    name: "Statistics"
    property var lstTemperature: []
    property var lstHumidity:[]
    property var lstPressure:[]

    onUpdate: {
        var temperature = _iSubject.getTemperature()
        var humidity    = _iSubject.getHumidity()
        var pressure    = _iSubject.getPressure()
        if (isNaN(temperature) === false) {
            lstTemperature.push(temperature)
        }
        if (isNaN(humidity) === false) {
            lstHumidity.push(humidity)
        }
        if (isNaN(pressure) === false) {
            lstPressure.push(pressure)
        }
        id_avg.text = "avg T:" + avgCalculator(lstTemperature)
                + "\navg H:" + avgCalculator(lstHumidity)
                + "\navg P:" + avgCalculator(lstPressure)
    }

    function avgCalculator(_arr){
        var sum = 0
        for (var i = 0; i < _arr.length; i++){
            sum += _arr[i]
        }

        var result = Math.round(sum / _arr.length * 10) / 10
        return result
    }

    Text {
        id: id_avg
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 3
        horizontalAlignment: Text.AlignRight
        x: 5
    }
}

