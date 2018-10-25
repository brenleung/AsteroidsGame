Spaceship flyer;
int DegreesOfRotation = 0;
public void setup() 
{
	background(0);
	size(500,500);
    flyer = new Spaceship();
}
public void draw() 
{
	background(0);
    flyer.show();
    System.out.println("Direction: " + flyer.getPointDirection());
    System.out.println("DirectionX: " + flyer.getDirectionX());
    System.out.println("DirectionY: " + flyer.getDirectionY());
}
public void keyPressed()
{
	//rotation:
	if(key == 'a')
	{
	   flyer.myPointDirection = flyer.myPointDirection-7;
	}
	if(key == 'd')
	{
	   flyer.myPointDirection = flyer.myPointDirection+7;
	}
    //movement:
    if (key == 'w')
    {
       flyer.accelerate(0.1);
    }
    if (key == 's')
    {
       flyer.accelerate(-0.1);
    }
}