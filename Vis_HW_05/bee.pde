

// image bee: https://grist.org/food/when-i-eat-honey-do-i-hurt-bees/

void bee() {
  
  PImage bee;
  
  bee = loadImage("bee.jpg"); // load bee image
  
  y_b = y_b - 3; // set up to move bee out
  
  // image(bee, width/3, 0, width/3, height/3); // original bee position
 
  image(bee, width/3, y_b, width/3, height/3); // move bee out
    
  // bee color changes with kernel function
  
  bee.loadPixels();
  
  PImage bee_k = createImage(bee.width, bee.height, RGB);
  for (int y = 1; y < bee.height-1; y++) {
    for (int x = 1; x < bee.width-1; x++) {
      float sum = 0; 
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*bee.width + (x + kx);
          float val = red(bee.pixels[pos]);
          sum += kernel_b[ky+1][kx+1] * val;
        }
      }
      bee_k.pixels[y*bee.width + x] = color(sum, sum, sum);
    }
  }
  bee_k.updatePixels();
  image(bee_k, width*2/3, y_b/3, width/3, height/3);
  
  //refill pink color
  
  bee_k.loadPixels();
  
  for (int i = 0; i < bee_k.pixels.length; i++) {
    
    float r = red(bee_k.pixels[i]);
    float g = green(bee_k.pixels[i]);
    float b = blue(bee_k.pixels[i]);
    if (r <250 && g < 200 && b <50) {
      bee_k.pixels[i] = color(200,80, 100); // hot pink color 
    }
    bee_k.updatePixels();
  }
  image(bee_k, width*2/3, height/3, width/3, height/3);
}
