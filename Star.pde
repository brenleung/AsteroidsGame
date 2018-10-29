class Star //note that this class does NOT extend Floater
{
   int myX, myY, mySize;
   Star() {
      myX = (int)(Math.random()*501);
      myY = (int)(Math.random()*501);
      mySize = (int)(Math.random()*10)+1;
   }
   void show ()
   {
   	  noStroke();
   	  fill(255,255,153,200);
   	  ellipse(myX,myY,mySize,mySize);
   }
}
