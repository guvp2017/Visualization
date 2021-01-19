
// MSDS6390 Assignment_04 submission

// Group 8 & 9: Shanqing Gu, Brett Benefield, and Cho Kim 

// Date: 09/25/2018


// Digital waves (2D with perlin noise)

float yoff = 0; 
float theta = 0;

float angle; // Hacker red eyes floats
float scalar = 8;


PFont f;  // Moving word font variable
float m;  // horizontal location of words
float x;
float e; //for scalar

int index = 0;

int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

int startX = 10;  // Binary numbers
int j = 0;

void setup() {
  
  size(800, 600);
  
  f = createFont("Chalkduster", 26, true);  // Word font variables
  m = width; 
  x = width;
   
  frameRate(30);
  ellipseMode(RADIUS);
  
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw() {
  
  movingWords();
  hackerEyes();
  
  // binaryNumber();
 
  beginShape(); 
  
  float xoff = 0; 
  fill(160, 214, 180);
  strokeWeight(1);
  fill(160, 214, 180);
  
  for (float x = 0; x <= width; x += 6) {
    float y = map(noise(xoff, yoff), 1, 0, width/2*cos(theta), height/2*sin(theta));
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
    // increment y dimension for noise
    yoff += 0.01;
  
    vertex(width, height);
    vertex(0, height);
  
 endShape(CLOSE);
  
 pushMatrix();
 binaryNumber();
 popMatrix();
 
 pushMatrix();
 dimMap();
 popMatrix();
 }
