class Asteroid extends Floater
{
	public Asteroid() {
		corners = 6;
		xCorners = new int[corners];
		yCorners = new int[corners];
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
	public int getPointDirection() {return myPointDirection;}
}