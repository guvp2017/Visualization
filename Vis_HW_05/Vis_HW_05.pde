
// MSDS6390 Unit 05_Imaging Assignment_05 submission
// Group 8: Shanqing Gu, Brett Benefield 
// Date: 10/02/2018


// image flower: https://www.publicdomainpictures.net/pictures/20000/velka/white-and-red-flower.jpg

// different kernels for flower, bee, and beetle
float[][] kernel_f = { {0, 0, 0}, {0,  1, 0}, {0, 0, 0}}; // identity kernel
float[][] kernel_b = {{ -1, -1, -1}, { -1,  9, -1}, { -1, -1, -1}}; // edge detection kernel    
float[][] kernel_bt = {{0, -1, 0}, {-1,  5, -1}, {0, -1, 0}}; // sharpen kernel

// directions for moving flower, bee and beetle with these variables
float x_f;
float y_f;
float x_b;
float y_b;
float x_bt;
float y_bt;

PImage flower, bee, beetle;
                     
void setup(){  
  // background(107,17,77);
  // noStroke();
  size(550, 400);
  frameRate(30); // control object moving speed
  
  //resizeble window setup
  surface.setResizable(true);
  
  flower= loadImage("white_and_red_flower_196819.jpg"); // load flower image
  
  // noLoop(); // loop start control 
}

void draw(){
  
  y_f = y_f - 10; // flower goes up this many pixels per frame
  
  // image(flower, 0, 0, width/3, height/3); // original flower position
  image(flower, 0, y_f, width/3, height/3); //move flower out
  
  // get bee and beetle draws
  bee();
  beetle();
  
  
  // flower color changes with kernel function
  
  flower.loadPixels();
  
  PImage edgeImg = createImage(flower.width, flower.height, RGB);
  for (int y = 1; y < flower.height-1; y++) {
    for (int x = 1; x < flower.width-1; x++) {
      float sum = 0; 
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*flower.width + (x + kx);
          float val = red(flower.pixels[pos]);
          sum += kernel_f[ky+1][kx+1] * val;
        }
      }
      edgeImg.pixels[y*flower.width + x] = color(sum, sum, sum);
    }
  }
  edgeImg.updatePixels();
  
  image(edgeImg, width/3, height/3, width/3, height/3);
  
  
  //refill with yellow color
    
  edgeImg.loadPixels();
  
  for (int i = 0; i < edgeImg.pixels.length; i++) {
    
    float r = red(edgeImg.pixels[i]);
    float g = green(edgeImg.pixels[i]);
    float b = blue(edgeImg.pixels[i]);
    if (r >200 && g > 200 && b > 200) {
      edgeImg.pixels[i] = color(200,180, 150); // yellow color 
    }
    edgeImg.updatePixels();
  }
 
image(edgeImg, width*2/3, height*2/3, width/3, height/3);
}

// allows to resize window 
void keyPressed() {
  surface.setSize(round(random(200, 1000)), round(random(200, 1000)));
}
 
