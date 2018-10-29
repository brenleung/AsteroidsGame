Spaceship flyer;
Star[] shiny;
int DegreesOfRotation = 0;
public void setup() 
{
	background(14);
	size(500,500);
    flyer = new Spaceship();
    shiny = new Star[250];
    for (int i = 0; i < shiny.length; i++)
    {
    	shiny[i] = new Star();
    }
}
public void draw() 
{
	background(14);
    for (int i = 0; i < shiny.length; i++)
    {
    	shiny[i].show();
    }
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
       flyer.accelerate(0.18);
    }
    if (key == 's')
    {
       flyer.accelerate(-0.18);
    }
}