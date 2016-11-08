class megaBoard

    {
        Board [][] board = new Board [3][3];
        //Board activeBoard;        //=Board[0][0];
Integer activeBoard_X;
Integer activeBoard_Y;

        //Create constructor

        public int boardXPos;
        public int boardYPos;
        int boardLen;
        public megaBoard (int xPos,int yPos,int len) {
          boardXPos=xPos;
          boardYPos=yPos;
          boardLen=len;
          for (int i = 0; i<3; i++){
            for (int j = 0; j<3; j++){
              board [i][j]  = new Board(xPos+i*(len/3), j*(len/3)+yPos, (int)((len/3)*(0.9)));
            }
          }          
        }
    

Board getActiveBoard () {
if (activeBoard_X == null  || activeBoard_Y == null){return null;}
  return board[activeBoard_X][activeBoard_Y];
   
}

void setActiveBoard (Integer boardX, Integer boardY) {
  activeBoard_X = boardX;
activeBoard_Y = boardY;

  
}

    void drawMegaBoard () {
    for (int i = 0; i<3; i++){
        for (int j = 0; j<3; j++){
          if (board[i][j] == getActiveBoard() || getActiveBoard() ==null){
            board[i][j].board_net(true);
    }
          else {
            board[i][j].board_net(false);
            }
    
        }
    
      }
    }
    
      boolean processMouse (char megaSymbol){
        for (int i = 0; i<3; i++){
          for (int j = 0; j<3; j++){
            if (board[i][j] == getActiveBoard() || getActiveBoard() ==null) {
              int [] moveCord = board[i][j].setSymbolAtMousePos(megaSymbol);
              if (moveCord != null)  {
                setActiveBoard(moveCord[0], moveCord[1]);
                  //activeBoard = board [moveCord[0]] [moveCord[1]];
                  return true;
            }
          }  
        } 
      }
  return false;
    }
    
    
    int megaControlMovement () 
    {
      if ((board[0][0].isXWin() && board[1][0].isXWin() && board[2][0].isXWin())|| 
          (board[0][1].isXWin() && board[1][1].isXWin() && board[2][1].isXWin())||
          (board[0][2].isXWin() && board[1][2].isXWin() && board[2][2].isXWin())||
          
          (board[0][0].isXWin() && board[0][1].isXWin() && board[0][2].isXWin())|| 
          (board[1][0].isXWin() && board[1][1].isXWin() && board[1][2].isXWin())||
          (board[2][0].isXWin() && board[2][1].isXWin() && board[2][2].isXWin())||
          
          (board[0][0].isXWin() && board[1][1].isXWin() && board[2][2].isXWin())||
          (board[2][0].isXWin() && board[1][1].isXWin() && board[0][2].isXWin())) {
            //println("X wins");  
            return 1;
          }
          
      if ((board[0][0].isOWin() && board[1][0].isOWin() && board[2][0].isOWin())|| 
          (board[0][1].isOWin() && board[1][1].isOWin() && board[2][1].isOWin())||
          (board[0][2].isOWin() && board[1][2].isOWin() && board[2][2].isOWin())||
          
          (board[0][0].isOWin() && board[0][1].isOWin() && board[0][2].isOWin())|| 
          (board[1][0].isOWin() && board[1][1].isOWin() && board[1][2].isOWin())||
          (board[2][0].isOWin() && board[2][1].isOWin() && board[2][2].isOWin())||
          
          (board[0][0].isOWin() && board[1][1].isOWin() && board[2][2].isOWin())||
          (board[2][0].isOWin() && board[1][1].isOWin() && board[0][2].isOWin())){
            //println("O wins");  
            return 2;
          }
  
        if (getActiveBoard() != null){
          if (getActiveBoard().canMove()!=true){
            //println("Cannot Move");
            return 0;
          }
        }
        return 3; 
        }

  public void megaBoard_set ( int posX, int posY, Board x_o) {
    board [posX][posY] = x_o;
  } 
  
  
  
  //не копируется activeBoard
  megaBoard copyAsMegaBoard() {
    megaBoard megaBoardAnotherCopy = new megaBoard (boardXPos, boardYPos, boardLen );
    for (int i = 0; i<3; i++){
      for (int j = 0; j < 3; j++){
        megaBoardAnotherCopy.megaBoard_set(i, j, board[i][j].copyAsBoard());

      }
    }
megaBoardAnotherCopy.setActiveBoard(activeBoard_X, activeBoard_Y);
    return megaBoardAnotherCopy;
  }
  
  
  
  void printMegaBoard() {
      for (int i = 0; i<3; i++){
        //println(board[0][i]+"" + board[1][i] + " "+ board[2][i]);
    }
  }
  
  
  
    void restartMegaGame () {
      for (int i = 0; i < 3; i++){
       for (int j = 0; j < 3; j++){
         board[i][j].restartSmall(); 
           }
          }
        setActiveBoard(null, null);   // = null;

  }

  
  void moveCenter (int xPos, int yPos, int len) {
              boardXPos=xPos;
              boardYPos=yPos;
              boardLen=len;
  
    for (int i = 0; i<3; i++){
               for (int j = 0; j<3; j++){
      board [i][j].boardXPos = xPos+i*(len/3);
      board [i][j].boardYPos = j*(len/3)+yPos;
      board [i][j].boardLen = (int)((len/3)*(0.9)) ;
      }
     }
    }          
   }  




