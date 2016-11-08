import javax.swing.*; 
SecondApplet2 HSTab;


public class PFrame2 extends JFrame { 
  public PFrame2(int width, int height) 
  { 
  setBounds(100, 100, 1200, 600); 
  HSTab = new SecondApplet2(); 
  add(HSTab); 
  HSTab.init(); 
  show(); 
  } 
  } 
  
  
  public class SecondApplet2 extends PApplet 
  { 
  //int ghostX, ghostY; 
   public void setup() 
  { 
    size (1200, 550);
   background(240); 
   noStroke();

  } 
  public void draw() {
    fill (255, 0, 0);
    strokeWeight (8);
    stroke (255);
    //textMode (CENTER);
    textSize (32);
    text ("Anna", 20, height/8-25);
    line (0, 60, width, 60);
    text ("Alex", 20, 2*height/8-33);
    line (0, 130, width, 130);
    text ("Milos", 20, 3*height/8-33);
    line (0, 200, width, 200);
    text ("Alan", 20, 4*height/8-33);
    line (0, 270, width, 270);
    text ("Vagif", 20, 5*height/8-33);
    line (0, 330, width, 330);
    text ("Electronic Arts", 20, 6*height/8-33);
    line (0, 400, width, 400);
    text ("RockStar North", 20, 7*height/8-33);
    line (0, 480, width, 480);
    text ("Infinity Ward", 20, 8*height/8-33);
    
    text ("A-Levels", 500, height/8-25);
    line (300, 0, 300, height);
    text ("Hours in ArmA 3", 425, 2*height/8-33);
    line (780, 0, 780, height);
    text ("A-Levels", 500, 3*height/8-33);
    text ("Students in Oxbridge", 400, 4*height/8-33);
    text ("Hours watching Anime", 400, 5*height/8-33);
    text ("2013 Income Revenue", 400, 6*height/8-33);
    text ("Grand Theft Auto V", 400, 7*height/8-33);
    text ("Call of Duty: Ghosts", 400, 8*height/8-33);
    
    text ("A*AAA", 875, height/8-25);
    text ("315", 885, 2*height/8-33);
    text ("A*AAA", 875, 3*height/8-33);
    text ("12", 900, 4*height/8-33);
    text ("425", 890, 5*height/8-33);
    text ("-3.97 billions USD", 825, 6*height/8-33);
    
    text ("800 million USD", 850, 7*height/8-45);
    text ("in 24 hours after release", 800, 7*height/8-15);
    
    text ("1 billion USD", 875, 8*height/8-30);
    text ("in 24 hours after release", 800, 8*height/8);
    
  }
    
    
    
    

  }
  
  

