class Asteroid extends Floater
{
	private int speedOfRot;
	public Asteroid() {
		corners = 7;
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = -3;
		yCorners[0] = -5;
		xCorners[1] = -11;
		yCorners[1] = -8;
		xCorners[2] = -13;
		yCorners[2] = 9;
		xCorners[3] = -1;
		yCorners[3] = 13;
		xCorners[4] = 10;
		yCorners[4] = 10;
		xCorners[5] = 12;
		yCorners[5] = 1;
		xCorners[6] = 6;
		yCorners[6] = -9;
		myColor = color(153, 153, 153);
		myCenterX = (int)(Math.random()*751);
		myCenterY = (int)(Math.random()*751);
		myDirectionX = (Math.random()*5)-2;
		myDirectionY = (Math.random()*5)-2;
		myPointDirection = (int)(Math.random()*360);
		speedOfRot = (int)(Math.random()*7)-3;
	}

	public void setX (int x) {myCenterX = x;}
	public int getX() {return (int)myCenterX;}
	public void setY (int y) {myCenterY = y;}
	public int getY() {return(int)myCenterY;}
	public void setDirectionX (double x) {myDirectionX = x;}
	public double getDirectionX() {return myDirectionX;}
	public void setDirectionY (double y) {myDirectionY = y;}
	public double getDirectionY() {return myDirectionY;}
	public void setPointDirection (int degrees) {myPointDirection = degrees;}
	public double getPointDirection() {return myPointDirection;}

	public void move()
	{
		turn(speedOfRot);
		super.move();
	}
}