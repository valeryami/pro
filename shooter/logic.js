// чтобы иметь доступ к разделяемым ресурсам, например состоянию игры
.pragma library

var gameState

function getGameState() { return gameState; }

var gameField;

var targetComponent = Qt.createComponent("Target.qml");
// создаем заготовку для мишеней
var bulletComponent = Qt.createComponent("Bullet.qml");

function newGameState(gameArea)
{
    gameState = gameArea;
    gameField = create2DArray(gameState.rows, gameState.cols);
    return gameState;
}

function getRandomRound(min, max)
{
    return Math.round(Math.random() * (max - min) + min);
}

function createTarget(parent, row, column)
{
    var target = targetComponent.createObject(parent, {"row": row, "col": column})
    gameField[row][column] = target;
}

function createBullet(parent, x, y)
{
    bulletComponent.createObject(parent, {"x": x, "y": y});
}

function destroyTarget(row, column)
{
    gameField[row][column] = null;
}

function create2DArray(rows, columns)
{
  var arr = [];

  for (var i=0;i<rows;i++) {
     arr[i] = [];
  }

  return arr;
}

function checkEmptyField(row, column)
{
    if (gameField[row][column] == null) {
        return true;
    } else {
        return false;
    }
}
