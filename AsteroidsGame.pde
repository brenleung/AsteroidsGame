Spaceship flyer;
int DegreesOfRotation = 0;
public void setup() 
{
	size(500,500);
    flyer = new Spaceship();
}
public void draw() 
{
    flyer.show();
    System.out.println(DegreesOfRotation);
}
public void keyTyped()
{
	if(key == 'a')
	{
	   DegreesOfRotation = DegreesOfRotation-7;;
	}
	if(key == 'd')
	{
	   DegreesOfRotation = DegreesOfRotation+7;
	}
}