
// make multiple snowfalkes in varied size in a class 

class SnowFlake {
  float canvasWidth;
  float canvasHeight;
  float xPos;
  float yPos;
  float snowSize;
  
  SnowFlake() throws Exception {
    throw new Exception("SnowFlake() constructor expects float, float, float");
  }
  
  SnowFlake(float canvasWidth, float canvasHeight, float snowSize) {
    this.canvasWidth = canvasWidth;
    this.canvasHeight = canvasHeight;
    
    this.xPos = random(this.canvasWidth);
    this.yPos = random(this.canvasHeight);
    this.snowSize = random(snowSize); // define the size of snowflakes
  }

  void drawFlake(){
    fill(255);
    noStroke();
    ellipse(xPos, yPos, snowSize, snowSize); // draw snowflakes with ellipse function
    
    yPos++;
    
    if(yPos > this.canvasHeight){
      yPos = 0;
      xPos = random(this.canvasWidth);
    }
  }
}

//
