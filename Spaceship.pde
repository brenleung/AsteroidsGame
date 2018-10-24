class Spaceship extends Floater
{
    //spaceship constructor:   
	public Spaceship() {
		corners = 4;
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = -10;
		yCorners[0] = 10;
		xCorners[1] = 16;
		yCorners[1] = 0;
		xCorners[2] = -10;
		yCorners[2] = -10;
		xCorners[3] = -3;
		yCorners[3] = 0;
		myColor = color(255,255,255);
		myCenterX = myCenterY = 250;
		myDirectionX = myDirectionY = 0;
		myPointDirection = 0;
	}

    //setters & getters:
	public void setX(int x) {myCenterX = x;}
	public int getX() {return (int)myCenterX;}
	public void setY (int y) {myCenterY = y;}
	public int getY() {return (int)myCenterY;}
	public void setDirectionX (double x) {myDirectionX = x;}
	public double getDirectionX() {return myDirectionX;}
	public void setDirectionY (double y) {myDirectionY = y;}
	public double getDirectionY() {return myDirectionY;}
	public void setPointDirection (int degrees) {myPointDirection = degrees;}
	public double getPointDirection() {return myPointDirection;}
}