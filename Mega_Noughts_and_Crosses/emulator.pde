int emulatorSpeed = 50;
class emulateAI {
    int XWinStat;
    int OWinStat;
    int drawStat;
    
    boolean XMove = true; 

void changeSpeed (int speedNeeded) {
        emulatorSpeed = speedNeeded;
        //println(emulatorSpeed);
      }
  
  void makeMove(megaBoard megaMove){
    
    if (megaMove.megaControlMovement() != 3){return;}
      if (frameCount % emulatorSpeed == 0 ){
        
        AI varAI = new AI (megaMove);
        if (XMove){
            varAI.makeMove('X', 'O');
            XMove = false;
            if (megaMove.megaControlMovement() == 1){XWinStat = XWinStat + 1; }
            
            
    }
  else {  
    varAI.makeMove('O', 'X');
    //println("Test O");
    XMove = true;
    if (megaMove.megaControlMovement() == 2){OWinStat = OWinStat + 1; }
    if (megaMove.megaControlMovement() == 0){drawStat = drawStat + 1; }
    

}
    }
//println("X-"+XWinStat+":"+"O -"+OWinStat);
    //text(XWinStat, 600, 750);
      }
      
      
      
}
