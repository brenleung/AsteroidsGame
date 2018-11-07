class Star //note that this class does NOT extend Floater
{
   private double myX, myY;
   private int mySize;
   public Star() {
      myX = (Math.random()*801);
      myY = (Math.random()*801);
      mySize = (int)(Math.random()*5)+1;
   }
   public void show ()
   {
   	noStroke();
   	fill(255,255,153,125);
   	ellipse((int)myX,(int)myY,mySize,mySize);
   }
   public void move()
   {
      myX = myX + 0.25;
      myY = myY + 0.25;
      if(myX >width)
      {     
        myX = 0;    
      }    
      else if (myX<0)
      {     
        myX = width;    
      }    
      if(myY >height)
      {    
        myY = 0;    
      }     
      else if (myY < 0)
      {     
        myY = height;    
      }  
   }
}