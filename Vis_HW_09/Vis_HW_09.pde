
import traer.physics;

int numParticles = 400;
// !--------------------------------------------------------------!
// WaterParticles and SparkParticles are subclasses of GenParticles,
// so they can be stored in a Gen Particle array!
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-2, 2);
    float velY = random(-2,2);
    // note the different origin locations, here
    // sparks are made near the top of the sketch, water comes up from the bottom
    if(random(10) > 5){
      p[i] = new HopperParticle(random(0,width), 299, velX, velY, 3, random(0,width), 299);  
    }
    else{
      p[i] = new lightbugParticle(width/2, height/2, velX, velY, 2, width/2, height/2);  
    }
  }
}

void draw() {
  fill(0, 36);
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}
