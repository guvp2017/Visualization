
// make multiple snowfalkes in varied size in a class 
// reference: stackoverflow.com/questions/36725926/how-to-turn-main-code-into-a-class-snowfall

class Snow{

  float w = random(width);
  float h = random(height);
  float r = random(15); // define the size of snowflakes

  void draw(){ 
    
    // Draw a title over the top of the chart    
    fill(255);
    textSize(22);
    text("Sea Ice and Snow Cover Extent from 1979 to 2018", width/3, height/11);   
    
    fill(255);
    noStroke();
    ellipse(w, h, r, r); // draw snowflakes with ellipse function
    
    h++;
    
    if(h > height){
      h = 0;
      w = random(width);
    } 
  }
}
