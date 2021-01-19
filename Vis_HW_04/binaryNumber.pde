
// Binary number flow

void binaryNumber(){
  
  startX--;
  if(startX < -width){
    startX+=width;
  }
  
  
  // Mimic number 1
  for( int i=startX; i<2*width; i+=height/10){
    rect(i-60, height-115, 1, 30);
  } 
  
  //Mimic number 0
    fill(160, 214, 180);
  for( int i = startX; i<2*width; i+=60){
    j++;
    j %= 5;
    if(j!=3 && j!= 10){
      ellipse (i-80,height-100,8,16);
    }
  }
}
