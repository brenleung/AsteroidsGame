class Star //note that this class does NOT extend Floater
{
   private int myX, myY, mySize;
   public Star() {
      myX = (int)(Math.random()*801);
      myY = (int)(Math.random()*801);
      mySize = (int)(Math.random()*5)+1;
   }
   public void show ()
   {
   	noStroke();
   	fill(255,255,153,125);
   	ellipse(myX,myY,mySize,mySize);
   }
   public void move()
   {
      myX = myX + 1;
      myY = myY + 1;
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