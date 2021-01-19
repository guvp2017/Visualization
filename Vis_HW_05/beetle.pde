
// image beetletle: https://www.pinterest.com/pin/173388654378788655/

void beetle(){
  
  PImage beetle;
  beetle = loadImage("beetle.jpg"); //load beetle image
  
 x_bt = x_bt - 3; // set to move beetle out 
   
  image(beetle, x_bt, height/3, width/3, height/3); 
  
  // beetle color changes with kernel function
  
  beetle.loadPixels();
  
  PImage beetle_k = createImage(beetle.width, beetle.height, RGB);
  for (int y = 1; y < beetle.height-1; y++) {
    for (int x = 1; x < beetle.width-1; x++) {
      float sum = 0; 
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*beetle.width + (x + kx);
          float val = red(beetle.pixels[pos]);
          sum += kernel_bt[ky+1][kx+1] * val;
        }
      }
      beetle_k.pixels[y*beetle.width + x] = color(sum, sum, sum);
    }
  }
  
  // refill hot pink color
  
  beetle_k.updatePixels();
  
  image(beetle_k, x_bt/2, height*2/3, width/3, height/3);
  
  beetle_k.loadPixels();
  
  for (int i = 0; i < beetle_k.pixels.length; i++) {
    
    float r = red(beetle_k.pixels[i]);
    float g = green(beetle_k.pixels[i]);
    float b = blue(beetle_k.pixels[i]);
    if (r <180 && g < 180 && b < 180) {
      beetle_k.pixels[i] = color(150,50, 20); // hot pink color 
    }
    beetle_k.updatePixels();
  }
  image(beetle_k, width/3, height*2/3, width/3, height/3); 
  
}
