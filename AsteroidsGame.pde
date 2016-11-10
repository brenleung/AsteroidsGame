
SpaceShip joe = new SpaceShip();
Asteroid[] ayy;

public void setup() 
{
  size(1200, 600);
  ayy = new Asteroid[10];
  for(int i = 0; i < ayy.length; i++) {ayy[i] = new Asteroid((int)(Math.random()*700),(int)(Math.random()*700));}
}

public void draw() 
{
  noStroke();
  background(0);
  joe.move();
  joe.show();
  for(int i = 0; i < ayy.length; i++)
  {
    ayy[i].show();
    ayy[i].move();
  }
}

class SpaceShip extends Floater  
{  
  public SpaceShip(){
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -16;
    yCorners[0] = 16;
    xCorners[1] = -4;
    yCorners[1] = 0;
    xCorners[2] = -16;
    yCorners[2] = -16;
    xCorners[3] = 16;
    yCorners[3] = 0;
    myColor = color(255, 0, 0);
    myCenterX = 600;
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;} 
  public void setDirectionY(double y) {myDirectionY = y;} 
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}
}

public void keyPressed()
{
  if (keyCode == LEFT) {joe.rotate(-10);}
  if (keyCode == RIGHT) {joe.rotate(10);}
  if (keyCode == UP) {joe.accelerate(.3);}
  if (keyCode == DOWN) {joe.accelerate(-.3);}
}

public void keyReleased()
{
  if (key == 32)
  {
    joe.setDirectionX(0);
    joe.setDirectionY(0);
    joe.setX((int)(Math.random()*1200));
    joe.setY((int)(Math.random()*600));
    joe.setPointDirection((int)(Math.random()*360));
    //fill(255);
    //rect(0, 0, 1200, 600);
  }
}

class Asteroid extends SpaceShip
{
  protected int aRotate;
  //protected float[] xCorners;   
  //protected float[] yCorners;
  public Asteroid(int x, int y) {
    aRotate = (int)(Math.random()*22-11);
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -10;
    yCorners[0] = 25;
    xCorners[1] = 10;
    yCorners[1] = 25;
    xCorners[2] = 25;
    yCorners[2] = 10;
    xCorners[3] = 25;
    yCorners[3] = -10;
    xCorners[4] = 10;
    yCorners[4] = -25;
    xCorners[5] = -10;
    yCorners[5] = -25;
    xCorners[6] = -25;
    yCorners[6] = -10;
    xCorners[7] = -25;
    yCorners[7] = 10;
    myColor = color(73, 21, 21);
    myCenterX = (int)(Math.random()*1200);
    myCenterY = (int)(Math.random()*600);
    myDirectionX = (int)(Math.random()*4)-2; 
    myDirectionY = (int)(Math.random()*4)-2;
    myPointDirection = (int)(Math.random()*2);
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;} 
  public void setDirectionY(double y) {myDirectionY = y;} 
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}

  public void move() 
  { 
    if(myDirectionX == 0) {myDirectionX = 2 - Math.random()*2;}
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    rotate(aRotate);
    if(myCenterX > width) {myCenterX = 0;}   
    else if (myCenterX < 0) {myCenterX = width;}      
    if(myCenterY > height) {myCenterY = 0;}     
    else if (myCenterY < 0) {myCenterY = height;}    
  }

  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

