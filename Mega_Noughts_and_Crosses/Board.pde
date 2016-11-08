class Board 

{
    public char [][] board = new char [3][3];
    //Create constructor
    public int boardXPos;
    public int boardYPos;
    int boardLen;
    public Board (int xPos,int yPos,int len) {
      boardXPos=xPos;
      boardYPos=yPos;
      boardLen=len;
      for (int i = 0; i< 3; i++) {
        for (int j = 0; j<3; j++) {
          board [i][j] = '_';
        }
      }
    }
    
  boolean isXWin() {
    if    
      ((board[0][0] == 'X' && board[1][0] == 'X' && board[2][0] == 'X')||
      (board[0][1] == 'X' && board[1][1] == 'X' && board[2][1] == 'X')||
      (board[0][2] == 'X' && board[1][2] == 'X' && board[2][2] == 'X')||
      
      (board[0][0] == 'X' && board[0][1] == 'X' && board[0][2] == 'X')||
      (board[1][0] == 'X' && board[1][1] == 'X' && board[1][2] == 'X')||
      (board[2][0] == 'X' && board[2][1] == 'X' && board[2][2] == 'X')||
      
      (board[0][0] == 'X' && board[1][1] == 'X' && board[2][2] == 'X')||
      (board[2][0] == 'X' && board[1][1] == 'X' && board[0][2] == 'X')){
    return true;
  }
  else {return false;}
  }

boolean isCharWin(char allySymbol) {
 if 
      ((board[0][0] == allySymbol && board[1][0] ==allySymbol && board[2][0] == allySymbol)||
      (board[0][1] == allySymbol && board[1][1] == allySymbol && board[2][1] == allySymbol)||
      (board[0][2] == allySymbol && board[1][2] == allySymbol && board[2][2] == allySymbol)||
      
      (board[0][0] == allySymbol && board[0][1] == allySymbol && board[0][2] == allySymbol)||
      (board[1][0] == allySymbol && board[1][1] == allySymbol && board[1][2] == allySymbol)||
      (board[2][0] == allySymbol && board[2][1] == allySymbol && board[2][2] == allySymbol)||
      
      (board[0][0] == allySymbol && board[1][1] == allySymbol && board[2][2] == allySymbol)||
      (board[2][0] == allySymbol && board[1][1] ==allySymbol && board[0][2] == allySymbol)){return true;}
  else {return false;}

}
  
  boolean isOWin() {
      if 
      ((board[0][0] == 'O' && board[1][0] == 'O' && board[2][0] == 'O')||
      (board[0][1] == 'O' && board[1][1] == 'O' && board[2][1] == 'O')||
      (board[0][2] == 'O' && board[1][2] == 'O' && board[2][2] == 'O')||
      
      (board[0][0] == 'O' && board[0][1] == 'O' && board[0][2] == 'O')||
      (board[1][0] == 'O' && board[1][1] == 'O' && board[1][2] == 'O')||
      (board[2][0] == 'O' && board[2][1] == 'O' && board[2][2] == 'O')||
      
      (board[0][0] == 'O' && board[1][1] == 'O' && board[2][2] == 'O')||
      (board[2][0] == 'O' && board[1][1] == 'O' && board[0][2] == 'O')){return true;}
  else {return false;}
  
  }
  
  boolean canMove() {
    for (int i = 0; i < 3; i++)
      for (int j = 0; j < 3; j++){
        if (board[i][j] == '_'){return true;}
  }
    return false;
  }
  
  boolean canXWin_now() {
  if (isXWin()){return false;}
  
    for (int i = 0; i < 3; i++){
      for (int j = 0; j< 3; j++){
      if (board[i][j] == '_' ){
  
              Board virt_board = copyAsBoard();
              virt_board.board[i][j] = 'X';
              if (virt_board.isXWin()){
               return true;
          }
        }
      }
    }
  return false;
  }
  
  boolean canOWin_now() {
  if (isOWin()){return false;}
  
    for (int i = 0; i < 3; i++){
      for (int j = 0; j< 3; j++){
      if (board[i][j] == '_' ){
  
              Board virt_board = copyAsBoard();
              virt_board.board[i][j] = 'O';
              if (virt_board.isOWin()){
               return true;
          }
        }
      }
    }
  return false;
  }
  
  
  
  

    //draw board net 
    public void board_net(boolean activeBoard) 
    {
      color activeBoardColor;
      if (activeBoard==true){
       //Not selected, but the one to go to
       activeBoardColor = color (255, 30);
    }
      else {
        //Not active boards
        activeBoardColor = color (#48D0FF);
      
      rectMode(CENTER);
      if (isXWin()){activeBoardColor = color(#63FC36);}
      if (isOWin()){activeBoardColor = color (#FF1414);}
      if (isXWin() && isOWin())  {activeBoardColor = color (255, 255, 0);}
     
      
      if (activeBoard == true){
        if (mouseX > boardXPos-boardLen/2   && mouseX < boardXPos +boardLen/2 && mouseY > boardYPos - boardLen/2 && mouseY < boardYPos + boardLen/2){
          //Big active Board
          activeBoardColor = color (#087CC6, 30);
     }
    }
      }
      
      fill (activeBoardColor);
      //Good idea
      noStroke();
      rect (boardXPos, boardYPos, boardLen+2, boardLen+2);
      for (int i = 0; i < 3;i++){
        for (int j = 0; j <3; j++){
          drawCell (boardXPos-boardLen/3*(1-i), boardYPos-boardLen/3*(1-j),boardLen/3, i, j, activeBoardColor);
        
       }
     }
     
     //========================================================
          
          fill (240);
          //rectMode(CORNER);
          rect (boardXPos-boardLen/2-4, boardYPos, 6, boardLen+8);
          rect(boardXPos+boardLen/2+4, boardYPos, 6, boardLen+8);
          //fill(255, 0, 0);
          rect (boardXPos+boardLen/2+8, boardYPos, 14, 200);
          rect (boardXPos, boardYPos+boardLen/2+8, width/3, 23 );
//     rect ();
    //==========================================================
   }
  
    private void drawCell(int cellXPos, int cellYPos, int cellLen,int x,int y,color fillcolor) 
    {
      rectMode(CENTER);  
      if (board[x][y] == '_'){
        if (mouseX > cellXPos - cellLen/2 && mouseX <  cellXPos + cellLen/2 && mouseY > cellYPos - cellLen/2 && mouseY < cellYPos + cellLen/2){
          //Little selected square
          fillcolor = color(#FFA61F);
          }
        }
      fill (fillcolor);
      rect (cellXPos, cellYPos, cellLen, cellLen);
      //Color of X_O and '_'
      fill(#FFA61F);
      textAlign(CENTER,CENTER);
      textSize (cellLen*0.7);
      text(board[x][y], cellXPos, cellYPos);
    }
    
    
     //put char at a pointed position of this board 
    public void board_set (int posX, int posY, char x_o) {
      board [posX][posY] = x_o;  
    }
    
    public int[] mousePosition() {
  //  int x=(mouseX-boardXPos-boardLen/6)/(boardLen/3);    
      int[] result=new int[2];
        if (mouseX > (boardXPos - boardLen/2) && mouseX < (boardXPos-boardLen/6) && mouseY < (boardYPos-boardLen/6) && mouseY > (boardYPos - boardLen/2)){
          result[0]=0;
          result[1]=0;
          return result;
        }
        if (mouseX > (boardXPos - boardLen/6) && mouseX < (boardXPos+boardLen/6) && mouseY < (boardYPos-boardLen/6) && mouseY > (boardYPos - boardLen/2)){
          result[0]=1;
          result[1]=0;
          return result;
        }
        if (mouseX > (boardXPos + boardLen/6) && mouseX < (boardXPos+1.5*boardLen/3) && mouseY < (boardYPos-boardLen/6) && mouseY > (boardYPos - boardLen/2)){
          result[0]=2;
          result[1]=0;
          return result;
        }
        if (mouseX > (boardXPos - boardLen/2) && mouseX < (boardXPos-boardLen/6) && mouseY < (boardYPos+boardLen/6) && mouseY > (boardYPos - boardLen/6)){
          result[0]=0;
          result[1]=1;
          return result;
        }
        if (mouseX > (boardXPos - boardLen/6) && mouseX < (boardXPos+boardLen/6) && mouseY < (boardYPos+boardLen/6) && mouseY > (boardYPos - boardLen/6)){
          result[0]=1;
          result[1]=1;
          return result;
        }
        if (mouseX > (boardXPos + boardLen/6) && mouseX < (boardXPos+1.5*boardLen/3) && mouseY < (boardYPos+boardLen/6) && mouseY > (boardYPos - boardLen/6)){
          result[0]=2;
          result[1]=1;
          return result;
        }
        if (mouseX > (boardXPos - boardLen/2) && mouseX < (boardXPos-boardLen/6) && mouseY > (boardYPos+boardLen/6) && mouseY < (boardYPos + boardLen/2)){
          result[0]=0;
          result[1]=2;
          return result;
        }
        if (mouseX > (boardXPos - boardLen/6) && mouseX < (boardXPos+boardLen/6) && mouseY > (boardYPos+boardLen/6) && mouseY < (boardYPos + boardLen/2)){
          result[0]=1;
          result[1]=2;
          return result;
        }
        if (mouseX > (boardXPos + boardLen/6) && mouseX < (boardXPos+1.5*boardLen/3) && mouseY > (boardYPos+boardLen/6) && mouseY < (boardYPos + boardLen/2)){
          result[0]=2;
          result[1]=2;
          return result;
        }
        else {
          return null;
        }
      }
  
  
    int [] setSymbolAtMousePos (char symbol) {
      int [] massive = mousePosition();
      if (massive == null) {
          return null;
          }
        if (board[massive[0]][massive[1]] == '_') {
          board_set(massive[0], massive[1] , symbol);
          return massive;
          }
        else {
          return null;
          }
  
    }
  
      char [][] copyAsArray() {
        char [][] boardCopy = new char [3][3];
        for (int i = 0; i < 3; i++){
          for (int j = 0; j < 3; j++){
            boardCopy[i][j] = board[i][j];
          }
        }
    return boardCopy;
      }
    
    Board copyAsBoard () {
      Board boardAnotherCopy = new Board (boardXPos, boardYPos, boardLen);
        for (int i = 0; i<3; i++){
          for (int j = 0; j < 3; j++){
            boardAnotherCopy.board_set(i, j, board[i][j]);
    
          }
        }
      return boardAnotherCopy;
      }
    
      void printBoard() {
        for (int i = 0; i<3; i++){
          //println(board[0][i]+"" + board[1][i] + " "+ board[2][i]);
      }
    }
      void restartSmall () {
          for (int i = 0; i < 3; i++){
           for (int j = 0; j < 3; j++){
            board [i][j] = '_'; 
           }
          } 
      }
  }
  
  
  
  






