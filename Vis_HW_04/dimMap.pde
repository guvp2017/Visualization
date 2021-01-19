

// "Sit back and watch hacks around the world in real time" by Jon Fingas
// The image is adapted from https://www.engadget.com/2014/06/24/live-hacking-map/

void dimMap() {
  PImage img2;
  img2 = loadImage("dims.jpg");
  
  
  // Replace black background with wave color by Brett
  img2.loadPixels();
  for (int i = 0; i < img2.pixels.length; i++) {
    float r = red(img2.pixels[i]);
    float g = green(img2.pixels[i]);
    float b = blue(img2.pixels[i]);
    if (r < 25 && g < 25 && b < 25) {
      img2.pixels[i] = color(255, 255, 255);
    }
  }
  img2.updatePixels();
  
  image(img2, width*1/3, height/2, width*2/3, height/2);  
}
