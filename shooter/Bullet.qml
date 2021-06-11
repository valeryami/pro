import QtQuick 2.7
import QtQuick.Window 2.2
import "logic.js" as Logic

Image {
    id: root
    width: 40
    height: 40

    transform: Translate {
        x: -width / 2
        y: -height / 2
    }

    property variant bullets: ["graphics/bullet-1.png", "graphics/bullet-2.png", "graphics/bullet-3.png",
                               "graphics/bullet-4.png", "graphics/bullet-5.png", "graphics/bullet-6.png"]

    source: bullets[Logic.getRandomRound(0, 5)]

    Timer {
        interval: Logic.getRandomRound(3500, 10000); running: true; repeat: false
        onTriggered: root.opacity = 0.0
    }

    onOpacityChanged: {
        if (opacity == 0.0) {
            root.destroy()
        }
    }

    // Задаём поведение анимации свойства прозрачности объекта
    Behavior on opacity { PropertyAnimation { duration: 100 } }
}
