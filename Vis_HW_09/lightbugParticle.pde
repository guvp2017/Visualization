class lightbugParticle extends GenParticle {
  float age;

  lightbugParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0; 
  }

  void display() {
    color c = lerpColor(color(200), color(255), age * 0.005); 
    fill(c);
    ellipse(x, y, radius, radius);
      
    age++;
  }
    void update() {

    y += vy;
    x += vx;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = random(0,width);
      y = random(0,height);
      vx = random(-1, 1);
      vy = random(-1, 1);
      age = 0;
    }
  }
}
