
// MSDS6390 Assignment 10: Final 3D Java Visualization
// Using Processing as an embedded library in Java, create a 3D visualization of a data source of your choosing

// Group 8: Shanqing Gu, Brett Benefield 
// Date: 12/11/2018


// Geographic Coordinates reference: https://github.com/CodingTrain/website/tree/master/CodingChallenges/CC_058_EarthQuakeViz3D
// City population data (2016) from https://simplemaps.com/data/world-cities

float angle;

Table table;
float radius = 250;

PImage earth;
PShape globe;

void setup() {
  
  // Settings for 3D
  size(1200, 900, P3D);
  
  // import earth image for 3D globe construction
  earth = loadImage("earth.jpg");
    
  // import city population data
  table = loadTable("worldcities.csv", "header");
    
  noStroke();
    
  // create globe with earth texture
  globe = createShape(SPHERE, radius);
  globe.setTexture(earth);
}

void draw() {
  
  background(50);
    
  // translate height*0.65 to height/2 because of Tokyo population (highest at 35,676,000)
  translate(width*0.5f, height*0.65f); 
  rotateY(angle);
  angle += 0.01;
    
  noLights();
  fill(100);
  noStroke();
    
  //sphere(radius = 250);
  shape(globe);
    
  for (TableRow row : table.rows()) {
    float lat = row.getFloat("lat");
    float lng = row.getFloat("lng");
    float pop = row.getFloat("population");
      
    float theta = radians(lat);      
    float phi = radians(lng) + PI;
      
    // polar, spherical and geographic Coordinates (https://vvvv.org/blog/polar-spherical-and-geographic-coordinates)
    float x = radius * cos(theta) * cos(phi); // x for left/right
    float y = -radius * sin(theta); // y for up/down
    float z = -radius * cos(theta) * sin(phi); // z for forward/backward
      
    // PVector pos for mapping individual city population
    PVector pos = new PVector(x, y, z);
    float h = pow(10, pop/35676000);  // let h_max =10    
    h= map(h*2, 0, 100, 5, log(h)*1500); 
      
    // PVector xaxis for calculating and returning the angle (in radians) between two vectors (xaxis and pos)
    PVector xaxis = new PVector(1, 0, 0);
    float angleb = PVector.angleBetween(xaxis, pos);
      
    // Calculate and return a vector composed of the cross product between two vectors.
    PVector raxis = xaxis.cross(pos); 
      
    //Translate function is controlled by using pushMatrix() and popMatrix().
    pushMatrix();
      
    // x for left/right translation, y for up/down translation, and z for forward/backward translation
    translate(x, y, z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
      
    // h_max =10, so r_max = 200 (most populated city color is red)
    fill(h*20, 220-h*10, 250-h*22);
    box(h, 1, 1);  // define the box shape  
    popMatrix();
    }
  }
