import javax.swing.*; 
SecondApplet1 CTab;


public class PFrame1 extends JFrame { 
  public PFrame1(int width, int height) 
  { 
  setBounds(100, 300, 1200, 300); 
  CTab = new SecondApplet1(); 
  add(CTab); 
  CTab.init(); 
  show(); 
  } 
  } 
  
  
  public class SecondApplet1 extends PApplet 
  { 
  //int ghostX, ghostY; 
   public void setup() 
  { 
    size (1200, 550);
   background(240); 
   noStroke();

  } 
  public void draw() {
    strokeWeight(5);
    stroke(#48D0FF);
    fill (255, 0, 0);
    //textMode (CENTER);
    textSize (32);
    //Programming
    text ("Programming: ", width/55, height/8);
    line (width/55, height/8+10, width/5, height/8+10);
    
    text ("Olexiy Dubilet", width/15, height/8+45);
    text ("Sergiy Kuzminov", width/15, height/8+90);
    
    //Design
    text ("Design: ", width/3, height/8);
    line (width/3, height/8+10, width/3+120, height/8+10);
    
    text ("Kate Sergeeva", width/3+45, height/8+45);
    text ("Olexiy Dubilet", width/3+45, height/8+90);
    text ("Dmytro Dubilet", width/3+45,  height/8+135);
    
    //Beta-testers
    text ("Beta Testing: ", width-width/3, height/8);
    line (805, height/8+10, 1000, height/8+10);
    
    text ("Elena Zanchini", width-width/3+20, height/8+45);
    text ("Kate Sergeeva", width-width/3+20, height/8+90);
//    text ("Nickolashka", 850, height/8+135);
//    text ("Toby Lawrence", 850, height/8+180);

//    //Special thanks
//    text ("Special Thanks: ", 100, 4*height/8+30);
//    line (105, 310, 330, 310);
//    
//    text ("Casey Reas", 150, 4*height/8+90);
//    text ("Ben Fry", 150, 4*height/8+135);
//    text ("Sergiy Kuzminov", 150, 4*height/8+180);
    
//    //Original idea
//    text ("Original idea: ", 600, 6*height/8-15);
//    line (605, 405, 800, 405);
//    
//    text ("Mike Dnipro", 650, 6*height/8+45);
//    text ("Arina Lvov", 650, 6*height/8+90);
    

    
  }
    
    
    
    
    

  }
  
  

