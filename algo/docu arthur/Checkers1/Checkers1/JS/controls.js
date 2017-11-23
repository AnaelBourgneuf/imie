// Global Var
var b = createBoard(10);
var p = createPawns(b);


// Main function
function main() {
      print(b, p);
}


// Define Coord: [startX, startY, endX, endY]
function createPawns(board) {
  var pawns = new Array();
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
    pawns.push(line);
  }
  return pawns;
}

function createBoard(size) {
  var board = new Array();

  for (i = 0; i < size; i++) {
    var line = new Array();
    for (j = 0; j < size; j++) {
      line.push((i + j) % 2 == 0);
    }
    board.push(line);
  }
  return board;
}

function selectBoxAt(x, y) {
    if (document.getElementById("fromX").value==0 && document.getElementById("fromY").value==0){
        document.getElementById("fromX").value=x;
        document.getElementById("fromY").value=y;
    }
    else{
        document.getElementById("toX").value=x;
        document.getElementById("toY").value=y;
    }
}

function isMovePossible(board, pawns, coords) {
  var startX = coords[0];
  var startY = coords[1];
  var endX = coords[2];
  var endY = coords[3];

  if (
    (startX >= 0 && startX < 10) &&
    (startY >= 0 && startY < 10) &&
    (endX >= 0 && endX < 10) &&
    (endY >= 0 && endY < 10)
  ) {
    if (board[startX][startY] && board[endX][endY]) {
      var start = pawns[startX][startY];
      if (start > 0) {
        var end = pawns[endX][endY];
        if (end == 0) {
          var shiftX = start == 1 ? 1 : -1;
          if (startX + shiftX == endX) {
            if (endY == startY + 1 || endY == startY - 1) {
              return true;
            }
          }
        }
      }
    }
  }
  return false;
} // Take Coord input

function move(coords, pawns) {
  var sX = coords[0];
  var sY = coords[1];
  var eX = coords[2];
  var eY = coords[3];
  // console.log(coords + " : -> " + sX + " " + sY + " " + eX + " " + eY);
  // console.log(pawns);

  pawns[eX][eY] = pawns[sX][sY];
  pawns[sX][sY] = 0;
} // Take Coord input

// function print(board, pawns) {
//   var str = '<div class=\"line\">';
//   for (i = 0; i < board.length; i++) {
//     var line = '';
//     for (j = 0; j < board.length; j++) {
//       var color = "white";
//       var team = "";
//       if (board[i][j]) {
//         color = "black";
//       }

//       if (pawns[i][j] > 0) {
//             team = " t" + pawns[i][j];
//       }
//       line += "<div class=\"box " + color + team + "\" onclick=\"selectBoxAt(" + i + "," + j + ")\"></div>";
//     }
//     str +=  line + '</div>';
//   }
//   document.getElementById("board").innerHTML = str;
// }

function print(board, pawns, x, y) {
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
        if (i == x && j == y) { 
            selected = " selected"; 
            } 
        if (pawns[i][j] > 0) { 
            team = " t" + pawns[i][j]; 
            } 
        line += "<div class=\"box " + color + team + selected + "\" onclick=\"selectBoxAt(" + i + "," + j + ")\"></div>"; 
        } 
    str += line + '</div>'; 
} 

document.getElementById("board").innerHTML = str; } 

function printCoords(x, y, onTop) { 
    if (onTop) { 
        document.getElementById("fromX").value = x;
        document.getElementById("fromY").value = y; 
    } 
    else { 
        document.getElementById("toX").value = x; 
        document.getElementById("toX").value = y; 
    } 
} 

function printMessage(message) { 
    document.getElementById("log").innerHTML = message; 
} 








