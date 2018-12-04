class Bullet extends Floater
{
	public Bullet() {}
	public Bullet (Spaceship flyer) {
		myCenterX = flyer.getX();
		myCenterY = flyer.getY();
		myPointDirection = flyer.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = (5 * Math.cos(dRadians)) + flyer.getDirectionX();
		myDirectionY = (5 * Math.cos(dRadians)) + flyer.getDirectionY();
	}

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

	public void show() {
		noStroke();
		fill(255);
		ellipse((int)myCenterX,(int)myCenterY,15,15);
	}
}