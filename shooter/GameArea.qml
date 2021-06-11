import QtQuick 2.7
import "logic.js" as Logic

Rectangle {
    id: grid
    property int squareSize: 64
    property int rows: 6
    property int cols: 6
    property int scores: 0

    width: cols * squareSize
    height: rows * squareSize

    InfoBar {
        id: infoBar
        scores: grid.scores
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            Logic.createBullet(grid, mouse.x, mouse.y)
            grid.scores--;
        }
    }

    Timer {
        id: createTargetsTimer
        interval: 350; running: true; repeat: true;
        // раз в секунду выбираем случайную ячейку,
        // проверяем наличие мишени, если ячейка пустая,
        // создаём мишень
        onTriggered: {
            var targetRow = Logic.getRandomRound(0, rows - 1);
            var targetColumns = Logic.getRandomRound(0, cols - 1);
            if (Logic.checkEmptyField(targetRow, targetColumns)) {
                Logic.createTarget(grid, targetRow, targetColumns)
            }
        }
    }
}
