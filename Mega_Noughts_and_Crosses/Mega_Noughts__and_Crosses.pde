import java.awt.Frame;

megaBoard mboard = new megaBoard(500, 200, 600);

megaBoard m2board = new megaBoard (850, 200, 600);

AI computerOpponent = new AI (mboard);
AI computerAlly = new AI (mboard);
emulateAI emulator = new emulateAI (); 



Button newGameButton = new Button       (0, mboard, 60, 25, 120, 50, "New GAME", 20);
Button hintButton = new Button          (1, mboard, 60, 78, 120, 50, "Hint", 20);
Button highScoresGameButton = new Button(2, mboard, 185, 25, 120, 50, "High Scores", 20);
Button creditsButton = new Button       (3, mboard, 185, 78, 120, 50, "Credits", 20);
Button SecBoard_switch = new Button     (4, mboard, 865, 50, 50, 50, "A", 1);
Button instructionButton = new Button   (5, mboard, 310, 25, 120, 50, "Help", 20 );
Button AISpeed = new Button             (6, mboard, 1050, 50, 120, 50, "Speed", 20);

Button EG_newGameButton = new Button         (0, mboard, 600, 350, 150, 100, "New GAME", 20);
//Button EG_hintButton = new Button          (1, mboard, 600, 400, 120, 50, "Hint", 20);
Button EG_highScoresGameButton = new Button  (2, mboard, 800, 300, 120, 50, "High Scores", 20);
Button EG_creditsButton = new Button         (3, mboard, 800, 400, 120, 50, "Credits", 20);


void setup () {
  size (1400, 800);
  background (240);
  
}



void draw () 
{
  

  if (mboard.megaControlMovement()==3) {
  drawBoard ();
  emulator.makeMove(m2board);
    
  newGameButton.drawButton();
  hintButton.drawButton();
  highScoresGameButton.drawButton();
  creditsButton.drawButton();
  instructionButton.drawButton();
  if (SecBoard_switch.switcher == true){
    AISpeed.drawButton();
  }
  
  
  newGameButton.processButton();
if (hintButton.processButton() == 1){
    m2board = mboard.copyAsMegaBoard();
    m2board.moveCenter(850, 200, 600);
    emulator.XMove = true;
}
  highScoresGameButton.processButton();
  creditsButton.processButton();
  instructionButton.processButton();
  AISpeed.processButton();
  
  SecBoard_switch.drawIButton();
  SecBoard_switch.processButton();
  //println(Button.swithcer);
  
} 
  else {
    drawEndScreen(mboard.megaControlMovement());
}
  
  textSize (46);
  //println(mouseX+":"+mouseY);
}




void drawBoard () {
mboard.drawMegaBoard();
if (m2board.megaControlMovement() !=3)
{
    m2board = mboard.copyAsMegaBoard();
    m2board.moveCenter(850, 200, 600);
    emulator.XMove = true;
}

if (SecBoard_switch.switcher == true){
  fill (240,20);
  rectMode(CORNER);
  rect (0, 0, width, height);
  
 if (mboard.boardXPos<200){
     m2board.drawMegaBoard();
     if (emulator.XWinStat>emulator.OWinStat){
       rectMode(CORNER);    
    fill (0, 0, 255);
    rect(800, 700, 300, 75);
    fill (#18CE0C);
    textSize(25);
    text ("X won: "+emulator.XWinStat+" Draw: "+emulator.drawStat, 950, 715);
    text ("O won: "+emulator.OWinStat +" Total: "+int(emulator.drawStat+emulator.OWinStat+emulator.XWinStat), 950, 745);
  }
  if (emulator.XWinStat<emulator.OWinStat){
    rectMode(CORNER);    
    fill (0, 0, 255);
    rect(800, 700, 300, 75);
    fill (255, 0, 0);
    textSize(25);
    text ("X won: "+emulator.XWinStat+" Draw: "+emulator.drawStat, 950, 715);
    text ("O won: "+emulator.OWinStat +" Total: "+int(emulator.drawStat+emulator.OWinStat+emulator.XWinStat), 950, 745);
  }
  if (emulator.XWinStat == emulator.OWinStat){
    rectMode(CORNER);
    fill (0, 0, 255);
    rect(800, 700, 300, 75);
    fill (#FFCA1A);
    textSize(25);
    text ("X won: "+emulator.XWinStat+" Draw: "+emulator.drawStat, 950, 715);
    text ("O won: "+emulator.OWinStat +" Total: "+int(emulator.drawStat+emulator.OWinStat+emulator.XWinStat), 950, 745);
  }
   
 }
  if (mboard.boardXPos>150) {
    
    mboard.moveCenter(mboard.boardXPos-4, 200, 600);
}
}
else {
  fill (240);
  rectMode(CORNER);
    rect (mboard.boardXPos+550, 0, width, height);
  
  if (mboard.boardXPos<500) mboard.moveCenter(mboard.boardXPos+4, 200, 600);
}
  
  if (mousePressed==true && mouseButton == LEFT) {
    if  (mboard.processMouse('X')) {
    m2board = mboard.copyAsMegaBoard();
    m2board.moveCenter(850, 200, 600);
    emulator.XMove = false;
  if (mboard.megaControlMovement() == 3){
      computerOpponent.makeMove('O', 'X'); 
        }
    }
  }  
}



  //1 -wins 2-o wins 0 -draw
void drawEndScreen (int state) {
  //X wins
    if (state == 1){
      rectMode(CORNER);
      fill (240);
      rect (0, 0, width, height);
      
      drawBoard();
      
      rectMode (CENTER);
      fill (#FF8503);
      stroke(1);
      rect (width/2, 325, 600, 400);
      fill(255);
      rect(width/2, 100, 600, 20);
      fill (0, 255, 0);
      textSize (72);
      text ("X WINS", width/2, height/4-20);
      EG_newGameButton.drawButton();
      EG_highScoresGameButton.drawButton();
      EG_creditsButton.drawButton();
      
      EG_highScoresGameButton.processButton();
      EG_creditsButton.processButton();
      EG_newGameButton.processButton();
    }
    //O Wins
    if (state == 2 ){
      rectMode(CORNER);
      fill (newGameButton.colorReset);
      rect (0, 0, width, height);
      
      drawBoard();

      rectMode (CENTER);
      fill (#FF8503);
      stroke(1);
      rect (width/2, 300, 600, 400);
      fill(255);
      rect(width/2, 100, 600, 20);
      fill (255, 0, 0);
      textSize (72);
      text ("O wins", width/2, height/4-20);
      EG_newGameButton.drawButton();
      EG_highScoresGameButton.drawButton();
      EG_creditsButton.drawButton();
      
      EG_highScoresGameButton.processButton();
      EG_creditsButton.processButton();
      EG_newGameButton.processButton();
      
    }
    //Draw
    if (state == 3 || state == 0){
      rectMode(CORNER);
      fill (newGameButton.colorReset);
      rect (0, 0, width, height);
      drawBoard();

      rectMode (CENTER);
      stroke(1);
      fill (#FF8503);
      rect (width/2, 300, 600, 400);
      fill(255);
      rect(width/2, 100, 600, 20);
      fill (0, 0, 255);
      textSize (72);
      text ("DRAW", width/2, height/4-20);
      
      EG_newGameButton.drawButton();
      EG_highScoresGameButton.drawButton();
      EG_creditsButton.drawButton();
      
      EG_highScoresGameButton.processButton();
      EG_creditsButton.processButton();
      EG_newGameButton.processButton();
    }
   }

