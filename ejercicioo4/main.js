// Variables
let board = null;
let game = new Chess();

// ClassicGame
let boardConfig = {
   draggable: true,
   position: "start", 
   sparePieces: false,   
   onDrop: function(source,target, piece, newPos, oldPos, orientation) {
       let move = game.move({
           from: source,
           to: target,
       });
       console.log("Source: " + source);
       console.log("Target: " + target);
       console.log("Piece: " + piece);
       console.log("newPos: " + Chessboard.objToFen(newPos));
       console.log("oldPos: " + Chessboard.objToFen(oldPos));
       console.log("Orientation: " + orientation);
       console.log("============================");
       if(move===null){
           return 'snapback';
       }
   }
}

// NQueenGame
let queenPositions;
let solution=[0,0,0,0,0,0,0,0];
function solutionToPositions(solution){
   let rows="abcdefgh"
   let positions={};
   solution.forEach((col,row)=>{
       const position = rows[col] + (row + 1);
       positions [position] = "bQ"
   });
   return positions;
}
let boardConfigNQueenGame = {
   draggable: true,
   position: "empty",  /*Marcar la posició de les peces al inici*/
   sparePieces: false,    /*No poner piezas fuera del tablero*/
   onDrop: function(source,target, piece, newPos, oldPos, orientation) {
       /*Console log para mostrar información mientras va funcionando el programa*/
       console.log("Source: " + source);
       console.log("Target: " + target);
       console.log("Piece: " + piece);
       /*Metode que permite describir una posición de un objecto de forma comprimida*/
       console.log("newPos: " + Chessboard.objToFen(newPos));
       console.log("oldPos: " + Chessboard.objToFen(oldPos));
       console.log("Orientation: " + orientation);
       console.log("============================");
       checkQueenThreats(newPos);
   }
}
// Llamar a los modos de juego
document.addEventListener("DOMContentLoaded",()=>{
   const classicGame = document.getElementById("classicGame");
   board = Chessboard('board', boardConfigNQueenGame);
   queenPositions=solutionToPositions(solution);
   // Adding AddEventListener for nQUeenGame button, jQuery style
   $("#nQueenGame").on('click',()=>{
       board = Chessboard('board', boardConfigNQueenGame);
       board.position(queenPositions);
   });


   //Adding AddEventListener for ClassicGame button, javascript vanilla style
   classicGame.addEventListener("click", ()=>{
       board = Chessboard('board', boardConfig);
   });
})


//TODO LO NUEVO
function convertCoord(c) {
   //convert a typical chess coord to a numerical one object, with X and Y, like "a1" -> x: 0, y: 0
   const col = c.charAt(0);
   const row = c.charAt(1);
   const y = col.charCodeAt(0) - 'a'.charCodeAt(0);
   const x = parseInt(row, 10) - 1;
   return { X: x, Y: y };
}
function convertPos(X,Y) {
   //convert a c.X, c.Y coordinate to a typical chess coord string, like c.X: 0, c.y: 0 -> "a1"
   const col = String.fromCharCode('a'.charCodeAt(0) + Y);
   const row = X + 1;
   return col + row;
}
let miTablero;
function checkQueenThreats(queenPosition){
   miTablero = Array(8);

   let queenCoords = Object.keys(queenPosition);
   for(let i = 0; i<8;i++){
       miTablero[i]=Array(8);
       for(let j=0;j<8;j++){
           miTablero[i][j]="0";
       }
   }
 
   queenCoords.forEach(element => {
       let positionQueen = convertCoord(element);
       miTablero[positionQueen.X][positionQueen.Y]="♛";
       markMenaces(positionQueen);
       console.log("Tablero de amenazas de la reina" + element);
       mostrarTablero(miTablero)
   });
   console.log("Tablero final");
   mostrarTablero(miTablero);

   displayResult(); // Llamada a la función displayResult
}
// funcion mostrar tablero
function mostrarTablero(tablero) {
    let filaSeparadora = "+---+---+---+---+---+---+---+---+";
    let letrasColumna = "  a   b   c   d   e   f   g   h";

    console.log(letrasColumna);

    for (let i = tablero.length-1; i >=0 ; i--) {
        console.log(filaSeparadora);
        let filaActual = "|";
        for (let j = 0; j < tablero[i].length; j++) {
            filaActual += " " + (tablero[i][j] || " ") + " |";
        }
        console.log(filaActual + " " + (i + 1));
    }

    console.log(filaSeparadora);
}

// funció que marca les caselles amenaçades per una reina
function markMenaces(position){
// funció que marca les caselles amenaçades per una reina
    markMenacesColumn(position);
    markMenacesRow(position);
    markMenacesDiag(position);
}

// funcion diagonales
function markMenacesDiag(position){
    const directions = [[-1, -1], [-1, 1], [1, -1], [1, 1]];

    directions.forEach(dir => {
        let [dx, dy] = dir;
        let x = position.X + dx;
        let y = position.Y + dy;
        
        while (x >= 0 && x < 8 && y >= 0 && y < 8) {
            if (miTablero[x][y] === "♛") {
                miTablero[x][y] = '♛!';
            } else {
                miTablero[x][y] = 'X';
            }
            x += dx;
            y += dy;
        }
    });
}
// funcion marcar columnas
function markMenacesColumn(position){
    for (let i = 0;i <= 7;i++){
        if((miTablero[i][position.Y]=="♛"|| miTablero[i][position.Y]=="♛!") && i!=position.X){//estem amenaçant una reina
            miTablero[i][position.Y]='♛!';
        }
        else if(i!=position.X){
            miTablero[i][position.Y]='X'; 
        }
    }
}
// funcion marcar filas
function markMenacesRow(position){
    for (let j = 0;j <= 7;j++){
        if((miTablero[position.X][j]=="♛" ||miTablero[position.X][j]=="♛!") && j!=position.Y){//estem amenaçant una reina
            miTablero[position.X][j]='♛!';
        }
        else if(j!=position.Y){
            miTablero[position.X][j]='X';
        }
    }
}

// alerta de ganar
function displayResult() {
    let hasThreat = false;
    for (let i = 0; i < miTablero.length; i++) {
        for (let j = 0; j < miTablero[i].length; j++) {
            if (miTablero[i][j] === '♛!') {
                hasThreat = true;
                break;
            }
        }
        if (hasThreat) {
            break;
        }
    }

    if (!hasThreat) {
        window.alert("¡Has ganado!");
    }
}

