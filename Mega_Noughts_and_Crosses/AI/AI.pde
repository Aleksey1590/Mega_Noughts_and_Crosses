class AI {
  megaBoard field;

  //Constructor 
  
  public AI (megaBoard otherField) {
    field = otherField;
}
  
  void makeMove(char allySymbol, char oppSymbol) {
    if (field.getActiveBoard() == null){
      field.setActiveBoard(1, 1);
}
    
    if (makeWinMove(allySymbol, oppSymbol) == true){
    //println("makeWinMove");
      return;
}
    if (makeSaveMove(allySymbol, oppSymbol) == true){
      //println("makeSaveMove");
      return;
      }

  if (controlCenterMove(allySymbol, oppSymbol) == true){
//  println("controlCenterMove");
  return;
}

  if (makePreventiveMove(allySymbol, oppSymbol) == true){
//println("makePreventiveMove");  
return;
}
      //println("makeRandomMove");
      makeRandomMove(allySymbol, oppSymbol);
    
  }
  

    
    boolean makeRandomMove (char allySymbol, char oppSymbol) {
        while (true) {
          int x = floor (random(3));
          int y = floor (random(3));    
          if (field.getActiveBoard().board[x][y] =='_') {
            field.getActiveBoard().board[x][y] = allySymbol;
            field.setActiveBoard(x, y);   // = field.board[x][y];
            return true;
                    }
                  }
      }
    
    boolean makeSaveMove(char allySymbol, char oppSymbol) {

      if (field.getActiveBoard().isCharWin(oppSymbol) ){
        return false;
     }

      for (int i =0; i< 3; i++){
        for (int j = 0; j<3;j++){ 
          if (field.getActiveBoard().board[i][j] == '_'){
            Board virt_board = field.getActiveBoard().copyAsBoard();
            virt_board.board[i][j] = oppSymbol;
            if (virt_board.isCharWin(oppSymbol)){
              field.getActiveBoard().board[i][j] = allySymbol;
              field.setActiveBoard(i, j);   // = field.board[i][j];
              return true;
                    }
                  }
                }
        
      }
        return false;
}
    
      boolean makeWinMove (char allySymbol, char oppSymbol) {
        //Board currentBoard = field.getActiveBoard();
        if (field.getActiveBoard().isCharWin(allySymbol)){
          return false;
          }
        for (int i =0; i< 3; i++){
          for (int j = 0; j<3;j++){
            if (field.getActiveBoard().board[i][j] == '_'){
              Board virt_board = field.getActiveBoard().copyAsBoard();
              virt_board.board[i][j] = allySymbol;
              if (virt_board.isCharWin(allySymbol)){
                field.getActiveBoard().board[i][j] = allySymbol;
                field.setActiveBoard(i, j);  // = field.board[i][j];
                return true;
                  }
                }
            }
          }
        return false;
        }


boolean makePreventiveMove(char allySymbol, char oppSymbol) {
  for (int i = 0; i < 100; i++){
          int x = floor (random(3));
          int y = floor (random(3));    
          if (field.getActiveBoard().board[x][y] =='_') {
megaBoard virt_MegaBoard = field.copyAsMegaBoard();
virt_MegaBoard.getActiveBoard().board[x][y] = allySymbol;
virt_MegaBoard.setActiveBoard(x, y);
if  (virt_MegaBoard.getActiveBoard().isCharWin(allySymbol) == false) {
  AI tester=new AI(virt_MegaBoard.copyAsMegaBoard());
  if  (tester.makeWinMove(allySymbol,oppSymbol)==true) continue;
}

if  (virt_MegaBoard.getActiveBoard().isCharWin(oppSymbol) == false) {
  AI tester=new AI(virt_MegaBoard.copyAsMegaBoard());
  if  (tester.makeWinMove(oppSymbol,allySymbol)==true) continue;
}

//if (virt_MegaBoard.getActiveBoard().isCharWin(allySymbol) == false  && virt_MegaBoard.getActiveBoard().isCharWin(oppSymbol) == false ){
  field.getActiveBoard().board[x][y] =  allySymbol;
  field.setActiveBoard(x, y);
  return true;
         //      }
         }      
   }
return false;
}
boolean controlCenterMove (char allySymbol, char oppSymbol) {

          int x = 1;
          int y = 1;    
          if (field.getActiveBoard().board[x][y] =='_') {
megaBoard virt_MegaBoard = field.copyAsMegaBoard();
virt_MegaBoard.getActiveBoard().board[x][y] = allySymbol;
virt_MegaBoard.setActiveBoard(x, y);
if  (virt_MegaBoard.getActiveBoard().isCharWin(allySymbol) == false) {
  AI tester=new AI(virt_MegaBoard.copyAsMegaBoard());
  if  (tester.makeWinMove(allySymbol,oppSymbol)==true) return false;
}

if  (virt_MegaBoard.getActiveBoard().isCharWin(oppSymbol) == false) {
  AI tester=new AI(virt_MegaBoard.copyAsMegaBoard());
  if  (tester.makeWinMove(oppSymbol,allySymbol)==true) return false;
}

//if (virt_MegaBoard.getActiveBoard().isCharWin(allySymbol) == false  && virt_MegaBoard.getActiveBoard().isCharWin(oppSymbol) == false ){
  field.getActiveBoard().board[x][y] =  allySymbol;
  field.setActiveBoard(x, y);
  return true;
         }      
return false;

}


      }




