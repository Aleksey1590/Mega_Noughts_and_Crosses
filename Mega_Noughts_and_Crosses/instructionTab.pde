import javax.swing.*; 
SecondApplet3 InstructTab;


//AI computerOpponent_instr = new AI (mboard);
//AI computerAlly_instr = new AI (mboard);
//emulateAI emulator_instr = new emulateAI (); 

public class PFrame3 extends JFrame { 
  public PFrame3(int width, int height) 
  { 
  setBounds(100, 100, 1200, 600); 
  InstructTab = new SecondApplet3(); 
  add(InstructTab); 
  InstructTab.init(); 
  show();
 
  } 
  } 
  
  
  public class SecondApplet3 extends PApplet 
  { 

   public void setup() 
  { 
    size (1200, 550);
   background(240); 
   noStroke();

  } 
  
  public void draw() 
  {
    textAlign(CORNER);
    fill(0);
    textSize(20);
    text("1: The cell in which you place your X ", 20, 20);
    text("forces your opponent to make a move", 45, 40);
    text("on a corresponding megaBoard.", 45, 60);
    text("When computers moves - he forces you as well.", 45, 80);
    
    text("2: When you place three X's in a row on one megaBoard", 20, 120);
    text("you win a round on this particular megaBoard.", 45, 140);
    text("When this happens megaBoard turns GREEN.", 45, 160);
    
    text("3: When your opponent places three O's in a row ", 20, 200);
    text("on one megaBoard he wins a round on ", 45, 220);
    text("this particular megaBoard.", 45, 240);
    text("When this happens megaBoard turns RED.", 45, 260);
    
    text("4: If you and your opponent ", 20, 300);
    text("win a round on one megaBoard.", 45, 320);
    text("MegaBoard will turn orange.", 45, 340);
    text("You can still use this megaBoard to win.", 45, 360);
    text("So as your opponent.", 45, 380);
    
    text("5: The goal is to win on 3 megaBoards in a row ", 20, 420);
    text("Good luck ;)", 45, 440);
    
    text("*P.S.  If you still can't figure out how to play it ", 20, 500);
    text("I have bad news for you", 78, 520);
    
    noFill();
    stroke(1);
    //println(mouseX+":"+mouseY);
    rectMode(CENTER);
    textSize(45);
    textAlign(CORNER);
    //Win
    fill(0, 255, 0);
    text(" YOU WIN", width/2, height/5);
    noFill();
    rect(width-width/5, height/5, 150, 150);
    
    fill(0, 255, 0);
    rect(width-width/5-50, height/5-50, 50, 50);  //1
    rect(width-width/5, height/5-50, 50, 50);   //2
    rect(width-width/5+50, height/5-50, 50, 50);  //3
    rect(width-width/5+50, height/5, 50, 50);  //6
    rect(width-width/5, height/5+50, 50, 50);  //8
    fill(255, 0, 0);
    rect(width-width/5-50, height/5, 50, 50);  //4
    rect(width-width/5-50, height/5+50, 50, 50);  //7
    noFill();
    rect(width-width/5+50, height/5+50, 50, 50);  //9
    fill(#FFCA1A);
    rect(width-width/5, height/5, 50, 50);    //5

    //Lose
    fill(255, 0, 0);
    text("YOU LOSE", width/2, height/2);
    noFill();
    rect(width-width/5, height/2, 150, 150);
    
    fill(255, 0, 0);
    rect(width-width/5, height/2-50, 50, 50);  //2
    rect(width-width/5, height/2, 50, 50);  //5
    rect(width-width/5, height/2+50, 50, 50);  //8
    fill(0, 255, 0);
    rect(width-width/5-50, height/2-50, 50, 50);  //1
    rect(width-width/5+50, height/2-50, 50, 50);  //3
    rect(width-width/5+50, height/2, 50, 50);  //6
    fill(#FFCA1A);
    rect(width-width/5-50, height/2, 50, 50);    //4
    
    
    //Draw
    fill(0, 0, 255);
    text(" DRAW ", width/2+30, height-height/5);
    noFill();
    rect (width-width/5, height-height/5, 150, 150);
    
    rect(width-width/5, height-height/5-50, 50, 50);  //2
    fill(255, 0, 0);
    rect(width-width/5, height-height/5, 50, 50);  //5
    rect(width-width/5, height-height/5+50, 50, 50);  //8
    fill(#FFCA1A);
    rect(width-width/5-50, height-height/5-50, 50, 50);  //1
    rect(width-width/5+50, height-height/5-50, 50, 50);  //3
    rect(width-width/5+50, height-height/5, 50, 50);  //6
    fill(0, 255, 0);
    rect(width-width/5-50, height-height/5, 50, 50);    //4
    
    fill(#FFCA1A);
    rect(width-width/5-50, height/2, 50, 50);    //4
     
}


   

  }
  
  

