
// Snow and ice image from: http://marinetechnologyinc.com/2013/12/go-fast-boat-winterization-tips/ 
// https://earthobservatory.nasa.gov/images/77270/oldest-arctic-sea-ice-is-disappearing

class SnowImage {
  PImage[] snowIce = new PImage[2];
  String image1, image2;
  float canvasWidth;
  float canvasHeight;
  float xPos;
  
  SnowImage() throws Exception {
     throw new Exception("SnowImage() constructor expects String, String, float, float");
  }
  
  SnowImage(String image1, String image2, float canvasWidth, float canvasHeight) {
    this.canvasWidth = canvasWidth;
    this.canvasHeight = canvasHeight;
    
    tint(255, 175);  // Tint blue
    snowIce[0] = loadImage(image1); // image for year 1980
    snowIce[1] = loadImage(image2); // image for year 2012
    
    xPos = 0;
  }
  
  void updateImage() {
      if (xPos < -900) {
        image(snowIce[1], 47, 20, this.canvasWidth-52, this.canvasHeight-85);
        textSize(22);
        fill(255,0,0);
        text("2012", this.canvasWidth/2, this.canvasHeight-100);
        return;
      } else {
        
        image(snowIce[0], 47, 20, this.canvasWidth-52, canvasHeight-85); // position the image accordingly
        //image(snowIce[1], 45, 20, width-50, height-80);  
        
        // add year label for image 1980
        fill(255,255,0);
        textSize(22);
        text("1980", this.canvasWidth/2, this.canvasHeight-100);
        
        xPos = xPos-4; // control image 2012 moving speed
        //if (xPos < -900) { 
        //  image(snowIce[1], 47, 20, this.canvasWidth-52, this.canvasHeight-85); // position the image accordingly
        //}
        //if(xPos <= -width*2) {
        //  xPos = 2;
        //} // when need to start over new round of moving
        
         // image(snowIce[2], -width-908-xPos, 20, width-48, height-80); // when need to compare both
        
        // add year label for image 1980 with changing color to red in the end
        for (int j = 0; j <frameCount; j++) {
          fill(j*4, 250-j*2, 250-j);
        }      
        
        // add ruler to guide the image 2012 moving with color changint to red in the end
        for (int j = 0; j <frameCount; j++) {
          stroke(j*4, 250-j*2, 250-j);
        } 
        strokeWeight(2);
        rect(40-xPos, 21, 1, 412);
      }
  }
}
