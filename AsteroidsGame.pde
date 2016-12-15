
SpaceShip joe = new SpaceShip();
ArrayList<Asteroid> ayy = new ArrayList<Asteroid>();
public boolean upKey, downKey;
Stars[] lel;
ArrayList <Bullet> balls = new ArrayList <Bullet>();

public void setup() 
{
  size(1200, 600);

  for(int i = 0; i < 10; i++)
    ayy.add(new Asteroid());

  lel = new Stars[150];
  for(int i = 0; i < lel.length; i++)
    lel[i] = new Stars();
}

public void draw() 
{
  noStroke();
  background(0);

  for(int i = 0; i < lel.length; i++)
    lel[i].show();

  joe.move();
  joe.show();

  for(int i = 0; i < ayy.size(); i++)
  {
    ayy.get(i).show();
    ayy.get(i).move();
  }
  for(int i = 0; i < ayy.size(); i++)
  {
    if(dist(joe.getX(), joe.getY(), ayy.get(i).getX(), ayy.get(i).getY()) <= 35)
    {
      ayy.remove(i);
      ayy.add(new Asteroid());
    }
  }
 
  if(upKey == true)
  {
    joe.setX((joe.getX()+(int)joe.getDirectionX()));
    joe.setY((joe.getY()+(int)joe.getDirectionY()));
    joe.accelerate(.05);
  }
  if(upKey == false) 
  {
    joe.setX((joe.getX()+(int)joe.getDirectionX()));
    joe.setY((joe.getY()+(int)joe.getDirectionY()));
    joe.accelerate(0);
  }
  if(downKey == true)
  { 
    joe.setX((joe.getX()+(int)joe.getDirectionX()));
    joe.setY((joe.getY()+(int)joe.getDirectionY()));
    joe.accelerate(-.05);
  }
  if(downKey == false) 
  {
    joe.setX((joe.getX()+(int)joe.getDirectionX()));
    joe.setY((joe.getY()+(int)joe.getDirectionY()));
    joe.accelerate(0);
  }

  for (int i = 0; i < balls.size (); i++)
  {
    if(balls.get(i).getX() > 1200 || balls.get(i).getY() > 600 || balls.get(i).getX() < 0 || balls.get(i).getY() < 0)
      balls.remove(i);
  }
  for (int i = 0; i < balls.size (); i++)
  {
    balls.get(i).move();
    balls.get(i).show();
  }

  for (int x = 0; x < balls.size (); x++)
  {
    for (int i = 0; i < ayy.size (); i++)

    {
      if (dist(ayy.get(i).getX(), ayy.get(i).getY(), balls.get(x).getX(), balls.get(x).getY())<30)
      {
        ayy.remove(i);
        balls.remove(x);
        break;
      }
    }
  }
}

class SpaceShip extends Floater  
{  
  public SpaceShip()
  {
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
    myColor = color(92, 232, 247);
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
  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;
  if (key == 83) {balls.add(new Bullet(joe));}
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
  }
  if (keyCode == UP) {upKey = false;}
  if (keyCode == DOWN) {downKey = false;}
}

class Asteroid extends SpaceShip
{
  protected int aRotate;
  public Asteroid() 
  {
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
    if(myDirectionX == 0) {myDirectionX = 4 - Math.random()*2;}
    if(myDirectionY == 0) {myDirectionY = 4 - Math.random()*2;}
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

public class Stars
{
  private int x, y;
  public Stars()
  {
    x = (int)(Math.random()*1200);
    y = (int)(Math.random()*600);
  }
  public void show()
  {
    stroke((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    noFill();
    ellipse(x, y, 10, 10);
  }
}

class Bullet extends Floater
{
  public Bullet(Spaceship x)
  {
    myCenterX = x.getX();
    myCenterY = x.getY();
    myPointDirection = x.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX += 5 * Math.cos(dRadians) + x.getDirectionX();
    myDirectionY += 5 * Math.sin(dRadians) + x.getDirectionY();
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

  public void show()
  {
    fill(255);
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }

  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
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

