import QtQuick 2.7
import "logic.js" as Logic

Image {
    id: root
    property int row: 0
    property int col: 0

    width: 56
    height: 56
    x: (col * (width + 8)) + 4
    y: (row * (height + 8)) + 4
    z: 1

    source: "graphics/Target.png"

    Timer {
        interval: Logic.getRandomRound(350, 1500); running: true; repeat: false
        onTriggered: root.opacity = 0.0
    }

    onOpacityChanged: {
        if (opacity == 0.0) {
            Logic.gameState.scores--
            Logic.destroyTarget(row, col)
            root.destroy()
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        // свойство определяет, будут ли передаваться события клика в ниже лежащие элементы, то есть те, которые по координате z
        // находятся ниже мишени
        propagateComposedEvents: true
        onClicked: {
            var scores =  isHit(root.width/2, root.height/2, mouse.x, mouse.y);
            if (scores != 0) {
                Logic.gameState.scores += scores;
                Logic.destroyTarget(row, col);
                root.destroy();
            } else {
                // передаём событие клика в ниже лежащие элементы по координате z
                mouse.accepted = false;
            }
        }
    }

    // задаем поведение анимации свойства прозрачности объекта
    Behavior on opacity { PropertyAnimation { duration: 250 } }

    function isHit(a, b, x, y)
    {
        var length = Math.sqrt(Math.pow(Math.abs(a - x), 2) + Math.pow(Math.abs(b - y), 2));
        if (length <= 5.6) {
            return 5;
        } else if (length <= 11.2) {
            return 4;
        } else if (length <= 16.8) {
            return 3;
        } else if (length <= 22.4) {
            return 2;
        } else if (length <= 28) {
            return 1;
        } else {
            // В данном случае мы попали в зону MouseArea,
            // которая является прямоугольником, но промахнулись
            // по самой мишени, которая является кругом
            return 0;
        }
    }
}
