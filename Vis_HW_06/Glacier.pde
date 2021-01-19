// Basic class to draw a triangle that appears to be melting
class Glacier {
  float iceWidth = 200;
  float topPoint = 275;
  float spacer = 65;
  float alpha = 200;
  float spread = iceWidth/2;
  
  Glacier() {
  }
  
  // Draw rectangle
  void update() {
    stroke(color(137, 207, 240, alpha));
    fill(color(137, 207, 240, alpha));
    triangle(width/2 - spread, height - spacer, width/2 + spread, height - spacer, width/2, height - topPoint);
  }
  
  // Reduce dimensions to simulate melting
  void melt() {
    if (topPoint >= 100) {
      spread += 25;
      topPoint -= 25;
    } else {
      return;
    }
  }
}
