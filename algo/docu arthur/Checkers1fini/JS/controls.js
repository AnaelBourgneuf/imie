// Define Coord: [startX, startY, endX, endY]


// Global Var
var board;
var pawns;

var startX = -1;
var startY = -1;
var endX = -1;
var endY = -1;

var message = "";
var currentPlayer = 1;
var toEat = [new Array(), new Array()];
var gameEnded = 0;


// Main function
function main() {
      board = createBoard(10);
      pawns = createPawns();
      if (gameEnded > 0) {
            currentPlayer = gameEnded;
            gameEnded = 0;
      }
      message = "Team " + currentPlayer + ", select pawn to move";
      print();
}

// Events listener
function selectBoxAt(x, y) {
      if (gameEnded > 0) {
            main();
      }
      else {
            if (isSelectionPossible(x,y)) {
                  if (startX == -1) {
                        startX = x;
                        startY = y;
                        message = "Team " + currentPlayer + ", select where to go";
                  }
                  else {
                        endX = x;
                        endY = y;
                        if (isMovePossible()) {
                              move();
                              message = "Team " + currentPlayer + ", select pawn to move";
                        }
                        else {
                              message = "Team " + currentPlayer + ", unable to move";
                        }
                  }
            }
            else {
                  message = "Team " + currentPlayer + ", cannot select that";
            }

            var win = winner();

            if (win > 0) {
                  message = "Team " + win + " won the game! Congrats!";
            }
            print();
      }


}

// UI Management
function print() {
      var str = '<div class=\"line\">';
      for (i = 0; i < board.length; i++) {
            var line = '';
            for (j = 0; j < board.length; j++) {
                  var color = "white";
                  var team = "";
                  var selected = "";
                  if (board[i][j]) {
                        color = "black";
                  }

                  if (startX != -1 && i == startX && j == startY) {
                        selected = " selected";
                  }

                  if (pawns[i][j] > 0) {
                        team = " t" + pawns[i][j];
                  }
                  line += "<div class=\"box " + color + team + selected + "\" onclick=\"selectBoxAt(" + i + "," + j + ")\"></div>";
            }
            str +=  line + '</div>';
      }
      document.getElementById("board").innerHTML = str;
      printCoords();
      printMessage();
}
function printCoords() {
      var sx = (startX != -1) ? startX : "";
      var sy = (startY != -1) ? startY : "";
      var ex = (endX != -1) ? endX : "";
      var ey = (endY != -1) ? endY : "";

      document.getElementById("fromX").value = sx;
      document.getElementById("fromY").value = sy;
      document.getElementById("toX").value = ex;
      document.getElementById("toY").value = ey;
}
function printMessage() {
      document.getElementById("log").innerHTML = message;
}

// Model
// - Creation
function createPawns() {
      var p = new Array();
      var maxX = board.length / 2 - 1;

      for (i = 0; i < board.length; i++) {
            var line = new Array();
            for (j = 0; j < board.length; j++) {
                  var x = 0;
                  if (board[i][j]) {
                        if (i < maxX) {
                              x = 1;
                        } else if (i > maxX + 1) {
                              x = 2;
                        }
                  }
                  line.push(x);
            }
            p.push(line);
      }
      return p;
}
function createBoard(size) {
      var b = new Array();

      for (i = 0; i < size; i++) {
            var line = new Array();
            for (j = 0; j < size; j++) {
                  line.push((i + j) % 2 == 0);
            }
            b.push(line);
      }
      return b;
}


// - Movement
function isInBoard(x, y) {
      if (x >= 0 && x < 10 && y >= 0 && y < 10) {
            return true;
      }
      return false;
}

function isSelectionPossible(x, y) {
      if (isInBoard(x,y)) {
            var pawn = pawns[x][y];
            if (startX == -1) {
                  if (pawn == currentPlayer) {
                        return true;
                  }
            }
            else {
                  var box = board[x][y];
                  if (pawn == 0 && box) {
                        return true;
                  }
            }
      }
      return false;
}

function isMovePossible() {
      if (board[startX][startY] && board[endX][endY]) {
            var start = pawns[startX][startY];
            var end = pawns[endX][endY];
            if (end == 0) {
                  var shiftX = start == 1 ? 1 : -1;
                  if (endX == startX + shiftX) {
                        if (endY == startY + 1 || endY == startY - 1) {
                              return true;
                        }
                  }
                  else if (endX == startX + 2  || endX == startX - 2) {
                        if (endY == startY + 2 || endY == startY - 2) {
                              var dirX = (endX < startX) ? -1 : 1;
                              var dirY = (endY < startY) ? -1 : 1;
                              var midX = startX + dirX;
                              var midY = startY + dirY;
                              var mid = pawns[midX][midY];
                              if (mid != 0 && mid != currentPlayer) {
                                    toEat[0].push(midX);
                                    toEat[1].push(midY);
                                    return true;
                              }
                        }
                  }
            }
      }
      return false;
}
function move() {
      var sX = startX;
      var sY = startY;
      var eX = endX;
      var eY = endY;

      pawns[eX][eY] = pawns[sX][sY];
      pawns[sX][sY] = 0;

      var eated = false;
      for (i = 0; i < toEat[0].length; i++) {
            var x = toEat[0][i];
            var y = toEat[1][i];
            pawns[x][y] = 0;
            eated = true;
      }
      toEat = [new Array(), new Array()];
      if (eated && nextMoveAvailable(endX, endY)) {
            startX = endX;
            startY = endY;
      }
      else {
            startX = -1;
            startY = -1;
            currentPlayer = (currentPlayer == 1) ? 2 : 1;
      }
      endX = -1;
      endY = -1;
}



function nextMoveAvailable(x, y) {
      var dirs = [-1, 1];

      for (i = 0; i < dirs.length; i++) {
            var dirX = dirs[i];
            var newX = x + dirX;
            for (j = 0; j < dirs.length; j++) {
                  var dirY = dirs[j];
                  var newY = y + dirY;

                  if (isInBoard(newX, newY)) {
                        var newP = pawns[newX][newY];
                        if (newP > 0 && newP != currentPlayer) {
                              // Box contain a pawn from other team
                              var nextX = newX + dirX;
                              var nextY = newY + dirY;
                              if (isInBoard(nextX, nextY)) {
                                    var nextP = pawns[nextX][nextY];
                                    if (nextP == 0) {
                                          return true;
                                    }
                              }

                        }
                  }
            }
      }
      return false;
}

// Endgame
function winner() {
      var t1 = 0;
      var t2 = 0;

      for (i = 0; i < pawns.length; i++) {
            for (j = 0; j < pawns[i].length; j++) {
                  var p = pawns[i][j];
                  if (p == 1) {
                        t1 ++;
                  }
                  else if (p == 2) {
                        t2 ++;
                  }
            }
      }
      if (t1 > 0 && t2 == 0) {
            gameEnded = 1;
            return 1;
      }
      else if (t2 > 0 && t1 == 0) {
            gameEnded = 2;
            return 2;
      }
      return 0;
}
