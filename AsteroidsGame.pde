Spaceship flyer;
Star[] shiny;
ArrayList<Asteroid> rocks = new ArrayList<Asteroid>();
int DegreesOfRotation = 0;
public void setup() 
{
	background(0);
	size(750,750);
    flyer = new Spaceship();
    shiny = new Star[700];
    for (int i = 0; i < shiny.length; i++)
    {
    	shiny[i] = new Star();
    }
    for (int j = 0; j < 35; j++) {
      rocks.add(new Asteroid());
    }
}
public void draw() 
{
	background(0);
  for (int i = 0; i < shiny.length; i++)
  {
    shiny[i].show();
    shiny[i].move(); 
  }
  strokeWeight(3);
  flyer.show();
  flyer.move();
  for (int i = 0; i < rocks.size(); i++)
  {
    strokeWeight(15);
    rocks.get(i).show();
    rocks.get(i).move();
    int distance = (int)Math.sqrt((flyer.getX()-rocks.get(i).getX())*(flyer.getX()-rocks.get(i).getX()) 
    + (flyer.getY()-rocks.get(i).getY())*(flyer.getY()-rocks.get(i).getY()));
    if(distance <= 20) {
      rocks.remove(i);
      break;
    }
  }
  int size = rocks.size();
  if (size < 15) {
    for (int j = 0; j < 20; j++) {
      rocks.add(new Asteroid());
    }
  }
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
