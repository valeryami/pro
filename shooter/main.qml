import QtQuick 2.7
import QtQuick.Controls 2.15
import "logic.js" as Logic

ApplicationWindow {
    visible: true
    width: 420
    height: 480
    title: qsTr("Target")

    GameArea {
        id: gameArea
        anchors.centerIn: parent
    }

    // после окончания создания окна инициализируем состояние игрового поля
    Component.onCompleted: {
        Logic.newGameState(gameArea)
    }
}
