import QtQuick 2.7
import QtQuick.Layouts 1.1

RowLayout {
    height: 40
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.leftMargin: 6
    anchors.rightMargin: 6
    spacing: 6
    z: 100

    // устанавливает доступ к текстовому полю,
    // в которое будет устанавливаться текущий счёт
    property alias scores: scores.text

    Text {
        text: qsTr("Scores")

        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        // поле с текущим счётом
        id: scores

        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    // в RowLayout сдвинет текстовые поля к левому краю InfoBar
    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
