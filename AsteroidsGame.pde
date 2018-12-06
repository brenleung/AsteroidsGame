Spaceship flyer;
Star[] shiny;
ArrayList<Asteroid> rocks = new ArrayList<Asteroid>();
ArrayList<Bullet> bill = new ArrayList<Bullet>();
int DegreesOfRotation = 0;
public void setup() 
{
	background(0);
	size(800,800);
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
   strokeWeight(10);
   rocks.get(i).show();
   rocks.get(i).move();
   if(dist(flyer.getX(), flyer.getY(), rocks.get(i).getX(), rocks.get(i).getY()) < 35)
   {
     rocks.remove(i);
     rocks.add(new Asteroid());
   }
  }
  for (int i = 0; i < bill.size(); i++)
  {
    bill.get(i).show();
    bill.get(i).move();
  }
  for (int i = 0; i < rocks.size(); i++) {
    for (int j = 0; j < bill.size(); j++) {
      if (dist(bill.get(j).getX(), bill.get(j).getY(), rocks.get(i).getX(), rocks.get(i).getY()) < 15) {
        bill.remove(j);
        rocks.remove(i);
        rocks.add(new Asteroid());
        break;
      }
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
     flyer.setX((int)(Math.random()*800));
     flyer.setY((int)(Math.random()*800));
  }
  if (key == ' ')
  {
     bill.add(0, new Bullet(flyer));
  }
}
