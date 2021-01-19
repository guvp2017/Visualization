
//MSDS 6390 Homework 02 Submission by Shanqing Gu and Brett Bebefield on 09/10/2018

// Brett's Photo
PImage bImg;

// Define variables to track original dimensions
float defaultWidth;
float defaultHeight;

// Shan's variables used for moving pupils
float x;
float angle;
float scalar = 13;

// Setup function
void setup() {
  // Set initial canvas size
  size(1200, 720);
  
  // Used to scale the image accordingly on resize
  defaultWidth = 1200;
  defaultHeight = 720;
  
  // Load image of brett for pixel color values
  bImg = loadImage("Brett.png");
  
  // Make the window resizeable
  surface.setResizable(true);
}

// Main loop function
void draw() {
  // Draw invidual portraits while scaling/translating coordinates as necessary
  drawPortraits();
}

// Select a random shape function
void drawBrett() {
  
  // Suprise me with a shape
  float randomShape = random(5);
  
  // Switch between the basic shape functions
  switch (int(randomShape)) {
    case 1:
      drawBrettEllipse();
      break;
    case 2:
      drawBrettRect();
      break;
    case 3: 
      drawBrettTriangle();
      break;
    case 4:
      drawBrettArc();
      break;
    default:
      drawBrettEllipse();
      break;
  }  
}

// Code adapted from https://processing.org/tutorials/pixels/
// Draw 50 ellipses using color from picture to color shape
void drawBrettEllipse() {
  // Adjust image to match current dimensions
  bImg.resize(width/2, height);
  // Load pixel array into memory
  bImg.loadPixels();
  
  // Randomly select x & y values
  for (int i = 0; i < 50; i++) {
    float x = random(width);
    float y = random(height);
    float diameter = width/60;
    
    // Get the color from image to use in new drawing
    color c = bImg.get(int(x),int(y));
    
    // Use the obtained color
    fill(c);
    
    // Draw the ellipse
    ellipse(x,y,diameter,diameter);
  }
}

// Code adapted from https://processing.org/tutorials/pixels/
// Draw 50 rectangles using color from picture to color shape
void drawBrettRect() {
  // Adjust image to match current dimensions
  bImg.resize(width/2, height);
  // Load pixel array into memory
  bImg.loadPixels();
  
  // Randomly select x & y values
  for (int i = 0; i < 50; i++) {
    float x = random(width);
    float y = random(height);
    float diameter = width/60;
    
    // Get the color from image to use in new drawing
    color c = bImg.get(int(x),int(y));
    
    // Use the obtained color
    fill(c);
    
    // Draw the rectangle
    rect(x,y,diameter,diameter);
  }
}

// Code adapted from https://processing.org/tutorials/pixels/
// Draw 50 triangles using color from picture to color shape
void drawBrettTriangle() {
  // Adjust image to match current dimensions
  bImg.resize(width/2, height);
  // Load pixel array into memory
  bImg.loadPixels();
  
  // Randomly select x & y values
  for (int i = 0; i < 50; i++) {
    float x = random(width);
    float y = random(height);
    float size = width/60;
    
    // Get the color from image to use in new drawing
    color c = bImg.get(int(x),int(y));
    
    // Use the obtained color
    fill(c);
    
    // Draw the triangle
    triangle(x,y,x + size,y + size, x + size, y);
  }
}

// Code adapted from https://processing.org/tutorials/pixels/
// Draw 50 arcs using color from picture to color shape
void drawBrettArc() {
  // Adjust image to match current dimensions
  bImg.resize(width/2, height);
  // Load pixel array into memory
  bImg.loadPixels();
  
  // Randomly select x & y values
  for (int i = 0; i < 35; i++) {
    float x = random(width);
    float y = random(height);
    float diameter = width/30;
    
    // Get the color from image to use in new drawing
    color c = bImg.get(int(x),int(y));
    
    // Use the obtained color
    fill(c);
    
    // Draw the arc
    arc(x,y,diameter,diameter,PI,radians(270));
    
  }
}


// Shan's codes for face drawing
void drawShan()

{  
  float sWidth = 600;
  float sHeight = 800;
 
  // Face
  noFill();
  strokeWeight(2);
  beginShape();
  curveVertex(sWidth/2-162, sHeight/2+6);
  curveVertex(sWidth/2-160, sHeight/2+101);
  curveVertex(sWidth/2-88,  sHeight/2+202);
  curveVertex(sWidth/2+43,  sHeight/2+240);
  curveVertex(sWidth/2+178, sHeight/2+140);
  curveVertex(sWidth/2+193, sHeight/2-1);
  curveVertex(sWidth/2+194, sHeight/2-3);
  endShape();
  
 // Mouth
  noFill();
  stroke(178, 102, 102);
  strokeWeight(3);
  arc(sWidth/2+55, sHeight/2+124, 110, 25, radians(0), radians(180), OPEN);
  arc(sWidth/2+55, sHeight/2+120, 110, 20, radians(180), radians(360), OPEN);

 // Eyebrow
  noFill();
  stroke(97, 69, 65);
  beginShape();
  vertex(sWidth/2-73, sHeight/2-86);
  strokeWeight(4);
  bezierVertex(sWidth/2-54, sHeight/2-82, sWidth/2-14, sHeight/2-83, sWidth/2+34, sHeight/2-50);
  endShape();
 
  beginShape();
  vertex(sWidth/2+71, sHeight/2-49);
  strokeWeight(4);
  bezierVertex(sWidth/2+73, sHeight/2-63, sWidth/2+111, sHeight/2-80, sWidth/2+162, sHeight/2-73);
  endShape();
  
  
  // Hair
  beginShape();
  vertex(sWidth/2-215, sHeight/2-11);
  stroke(32, 29, 22);
  bezierVertex(sWidth/2-216, sHeight/2-295, sWidth/2+186, sHeight/2-283, sWidth/2+200, sHeight/2-42);
  bezierVertex(sWidth/2+192, sHeight/2-155, sWidth/2-130, sHeight/2-205, sWidth/2-177, sHeight/2-43);
  endShape();
  
  
  // Nose
  noFill();
  stroke(200,150, 150);
  beginShape();
  vertex(sWidth/2+4, sHeight/2+32);
  quadraticVertex(sWidth/2+1, sHeight/2+66, sWidth/2+41, sHeight/2+60);
  quadraticVertex(sWidth/2+82, sHeight/2+65, sWidth/2+80, sHeight/2+60);
  vertex(sWidth/2+73, sHeight/2+3);
  endShape();
  
  // Right eye
  noFill();
  stroke(180, 130, 100);
  beginShape();
  strokeWeight(2);
  vertex(sWidth/2-67, sHeight/2-35);
  bezierVertex(sWidth/2-67, sHeight/2-37, sWidth/2-31, sHeight/2-54, sWidth/2+6, sHeight/2-31);
  bezierVertex(sWidth/2+3, sHeight/2-20, sWidth/2-29, sHeight/2-25, sWidth/2-67, sHeight/2-34);
  endShape();
  
  // Left eye
  noFill();
  stroke(180, 130, 100);
  beginShape();
  noFill();
  strokeWeight(2);
  vertex(sWidth/2+87, sHeight/2-32);
  bezierVertex(sWidth/2+87, sHeight/2-48, sWidth/2+120, sHeight/2-50, sWidth/2+159, sHeight/2-29);
  bezierVertex(sWidth/2+157, sHeight/2-25, sWidth/2+121, sHeight/2-25, sWidth/2+88, sHeight/2-28);
  endShape();
   
  // Right ear
  noFill();
  stroke(196, 138, 116);
  bezier(sWidth/2-176, sHeight/2+114, sWidth/2-213, sHeight/2+74, sWidth/2-214, sHeight/2+1, sWidth/2-174, sHeight/2-12);
  bezier(sWidth/2-170, sHeight/2+74, sWidth/2-186, sHeight/2+70, sWidth/2-191, sHeight/2+42, sWidth/2-171, sHeight/2+28);
  
  // Shan's moving pupils
  
  angle += 0.75;
  
  float ang = radians(angle*2);

  x = sWidth/2 + (scalar * cos(ang));
  
  fill(0);
  ellipse(x-30, sHeight/2-34, scalar, scalar); // float scalar = 13;
  ellipse(x+111, sHeight/2-35, scalar, scalar); // float scalar = 13;
}

// Code adapted from https://processing.org/tutorials/pixels/
void drawPortraits() {
  // Push current transformation matrix onto stack
  pushMatrix();
  
  // Scale the portraits as a percentage of original size
  scale(width/defaultWidth, height/defaultHeight);
  
  // Draw Shan's portrait
  drawShan();
  
  // Pop transformation matrix off the stack
  popMatrix();
  
  // Move Brett's portrait over half the width so they don't overlap
  translate(width/2,0);
  
  // Draw Brett's portrait
  drawBrett();
}
