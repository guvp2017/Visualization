class HopperParticle extends GenParticle {
  float age;

  HopperParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(0,400);
  }

  void update() {
    if(y >= height - radius) { // added bounce here
      y = height - radius;
      vy = -0.5 * vy; 
      radius = radius * 0.75;  // radius shrinks when a spark hits something
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }

  void display() {
    color c = color(17,206,37); // create the changing color effect
    fill(c);
   rect(x, y, 10, 3);
  }

  void regenerate() {
    if (age > 300) {    // sparks die at age 300
      x = originX;
      y = originY;
      vx = random(-1.5, 1.5);    // more x velocity than y
      vy = random(-3, -0);
      age = 0;
      //radius = 5.0;
    }
  }
}
