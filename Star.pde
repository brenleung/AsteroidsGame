class Star //note that this class does NOT extend Floater
{
   int myX, myY, mySize;
   Star() {
      myX = (int)(Math.random()*801);
      myY = (int)(Math.random()*801);
      mySize = (int)(Math.random()*5)+1;
   }
   void show ()
   {
   	  noStroke();
   	  fill(255,255,153,125);
   	  ellipse(myX,myY,mySize,mySize);
   }
}
