
// Red eyes for the hacker 

void hackerEyes() {
  
  // import hacker image 'whitehat.png" from (https://www.ecpi.edu/sites/default/files/whitehat.png)
  PImage img1;
  img1 = loadImage("whitehat.png");
  image(img1, 0, 0, width/3, height/3);  
  tint(160, 214, 180);
  
  
  // The moving red eyes for the hacker (refer to our HW2)
  
  angle += 5;
  
  float ang = radians(angle*2);

  e = width/6+(scalar * sin(ang));
  
  fill(255, 0, 0);
  ellipse(e-15, height/6+25, scalar, scalar); // float scalar = 8;
  ellipse(e+15, height/6+25, scalar, scalar); // float scalar = 8;
  
  fill(255, 0, 0);
  ellipse(e-15, height/6+25, scalar/6, scalar/6); // float scalar = 8;
  ellipse(e+15, height/6+25, scalar/6, scalar/6); // float scalar = 8;  
}
  
