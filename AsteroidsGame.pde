Spaceship flyer;
Star[] shiny;
int DegreesOfRotation = 0;
public void setup() 
{
	background(0);
	size(750,750);
    flyer = new Spaceship();
    shiny = new Star[400];
    for (int i = 0; i < shiny.length; i++)
    {
    	shiny[i] = new Star();
    }
}
public void draw() 
{
	background(0);
  for (int i = 0; i < shiny.length; i++)
  {
  	shiny[i].show(); 
  }
  strokeWeight(3);
  flyer.show();
  flyer.move();
}
public void keyPressed()
{
	//rotation:
	if(key == 'a')
	{
	   flyer.myPointDirection = flyer.myPointDirection-11;
	}
	if(key == 'd')
	{
	   flyer.myPointDirection = flyer.myPointDirection+11;
	}
  //movement:
  if (key == 'w')
  {
     flyer.accelerate(0.12);
  }
  if (key == 's')
  {
     flyer.accelerate(-0.12);
  }
  if (key == 'h')
  {
     flyer.setDirectionX(0);
     flyer.setDirectionY(0);
     flyer.setPointDirection((int)(Math.random()*360));
     flyer.setX((int)(Math.random()*800)+25);
     flyer.setY((int)(Math.random()*800)+25);
  }
}