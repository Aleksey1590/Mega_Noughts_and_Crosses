class Button {
  boolean mouseActive = false;
  int action;    //Отвечает за тип\функцию\действие кнопки
  megaBoard megaAction=null;
  AI megaHint;
  int xPos, yPos;  // Coords of buttons
  int w, h;       //Длина и высота кнопки
  String buttonText; 
  int buttonTextSize;
  color colorReset = color(240);
  PFrame1 Credits;
  PFrame2 highScores;
  PFrame3 instructions;
  emulateAI emuSpeed = new emulateAI();
  public boolean switcher = false;
  color iColor = color (255);
  //pendingScreen  creditTab = new pendingScreen();
  //constructor
  
  public Button (int buttonAction, megaBoard MAction, int buttonXPos, int buttonYPos, int buttonWidth, int buttonHeight, String buttonString, int buttonTextS){
    action = buttonAction;
    megaAction = MAction;
    xPos = buttonXPos;
    yPos = buttonYPos;
    w = buttonWidth;
    h = buttonHeight;
    buttonText = buttonString;
    buttonTextSize = buttonTextS;
    megaHint = new AI (megaAction);
    //add(creditTab);
    }
  
  public void drawButton () {  //Отрисовка самой кнопки
    fill(255);
    rectMode(CENTER);
    rect (xPos, yPos, w, h);
    fill(128);
    textAlign(CENTER);
    textSize(buttonTextSize);
    text (buttonText, xPos, yPos+10);
    
  }
  
  public void drawIButton (){
      noStroke();
    fill(iColor);
    rectMode(CENTER);
    rect (width/2+192, height/16, 2*w+5-1, h);
    stroke (0);
    strokeWeight(1);
    line(width/2+3*w+8, yPos-15, width/2+3*w+8, yPos+15);
    fill(0);
    textSize(40);
    text("O", width/2+4*w+20, yPos+15);
    noStroke();
    fill (220);
    ellipse (xPos, yPos, w, w);
  
  }
  
    public int processButton () {
      if (mouseActive==true) {
        if (!mousePressed)  { 
          mouseActive=false;
          }
        return -1;
}
     if ((mousePressed) && (mouseX < xPos+(w/2)) && (mouseX > xPos-(w/2)) && (mouseY > yPos-(h/2)) && (mouseY < yPos+(h/2))){
       mouseActive=true;
       if (action == 0)
      {
        rectMode(CORNER);
        fill (240);
        rect(0, 0, width, height);
        megaAction.restartMegaGame();
        return 0;
      } 
      else if (action==1) 
      {
        megaHint.makeMove('X', 'O');
        if (megaAction.megaControlMovement() == 3){
        megaHint.makeMove('O', 'X');
        return 1;
}
      }
      else if (action==2) 
      {
       if (highScores==null||!highScores.isVisible()) //проверим что наше окошко не создано и не видно
       highScores = new PFrame2 (width, height); 
       highScores.setTitle("High Scores");
       return 2;
      }
      else if (action==3) 
      {
       if (Credits==null||!Credits.isVisible()) //проверим что наше окошко не создано и не видно
       Credits = new PFrame1 (width, height); 
       Credits.setTitle("Credits"); 
       return 3;
      }

      else if (action == 4){
          if (switcher == true){
          switcher = false;
          xPos = xPos -50;
          iColor = color(255);
        }
          else {
          switcher = true ;
          xPos = xPos +50;
          iColor = color (#FFAE17);
        }
          return 4;
      }
      else if  (action == 5)
      {
        if (instructions==null||!instructions.isVisible()){
          instructions = new PFrame3 (width, height);
          instructions.setTitle("Instructions");
          return 5;
        }
      }
      
      else if (action == 6){
        int highSpeed = 1;
        int mediumSpeed = 25;
        int slowSpeed = 50;
//        if (emuSpeed.emulatorSpeed == 50){
//          println(emuSpeed.emulatorSpeed); 
//        }
//        else if (emuSpeed.emulatorSpeed == 25){
//          emuSpeed.emulatorSpeed = 1; 
//        }
//        else {
//            emuSpeed.emulatorSpeed = 50;
//          }
          //println(emulatorSpeed);
          if (emulatorSpeed == 50){
            emulatorSpeed = 25;
          }
          else {if (emulatorSpeed == 25)   
            {emulatorSpeed = 10;}
          else if (emulatorSpeed ==10 )
            {emulatorSpeed = 1;}
            else {emulatorSpeed =50;}
          }
            //println(emulatorSpeed);
          
              
          return 6;
        }
      

      //println (switcher);
    }
  return -1;  
  
  }
  
  
}

