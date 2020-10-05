import QtQuick 2.0
import "Behavior"

Item {
    property IQuackBehavior quackBehavior

    function performQuack(){
        if (quackBehavior)
            quackBehavior.quack()
    }
}
