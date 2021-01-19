
// Snow and ice image from: http://marinetechnologyinc.com/2013/12/go-fast-boat-winterization-tips/ 

 void snow_ice() {
   
  PImage snowIce;
  
  snowIce = loadImage("snowIce.jpg"); // load snowIce image

  // snowIce color changes with kernel function
  
  snowIce.loadPixels();
  
  PImage snowIce_k = createImage(snowIce.width, snowIce.height, RGB);
  for (int y = 1; y < snowIce.height-1; y++) {
    for (int x = 1; x < snowIce.width-1; x++) {
      float sum = 0; 
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*snowIce.width + (x + kx);
          float val = red(snowIce.pixels[pos]);
          sum += kernel[ky+1][kx+1] * val;
        }
      }
      snowIce_k.pixels[y*snowIce.width + x] = color(sum, sum, sum);
    }
  }
  snowIce_k.updatePixels();
  image(snowIce_k, 45, 20, width-50, height-80); // position the image accordingly
 }
