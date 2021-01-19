// MSDS 6390 HW_03 for Dynamic Composition I (Kinematics Animation for Hurricane Florence)


int xPos = 100;
int xDir =1;

void setup()
{
  size(800,800);
  smooth();
  noStroke();
  }

void draw()
{
  background(0);
  translate(width/2, height/2);
   
  // The eye
  
  fill(255);
  ellipse(0, 0, 50, 50);
   
  // The red 
  
  fill(255, 0 ,0 );
 
  for (int i =0; i<5; i++)
  { 
   ellipse(xPos/3, -xPos/3, 25, 25);
   rotate(frameCount/7.2*radians(72));
   xPos=xPos+xDir;
   if (xPos>width/2-50 || xPos<50)
   {
    xDir=-xDir;
   }
  }
  
  //The Green
  
  fill(0, 255,0);
  for (int i =0; i<5; i++)
  { 
   rect(xPos/4, -xPos/4, 10, 60);
   rotate(frameCount/18*radians(72));
   xPos=xPos+xDir;
   if (xPos>width/2-50 || xPos<50)
   {
    xDir=-xDir;
   }
  }
  
  // The Blue   
  fill(0, 0,255);
  for (int i =0; i<5; i++)
  { 
   ellipse(xPos/6, -xPos/6, 25, 25);
   rotate(frameCount/18*radians(72));
   xPos=xPos+xDir;
   if (xPos>width-50 || xPos<50)
   {
    xDir=-xDir;
   }
  }
  
  // The outerside
  fill(0, 255,255);
  for (int i =0; i<2; i++)
  { 
   rect(xPos/2+10, -xPos/2+60, 10, 60);
   rotate(frameCount/18*radians(72));
   xPos=xPos+xDir;
   if (xPos>width/2-50 || xPos<50)
   {
    xDir=-xDir;
   }
  }
  }
  
  
  
