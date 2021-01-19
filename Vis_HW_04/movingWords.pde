
// Moving words to give the explain the drawing

void movingWords() {
  background(0);
  fill(255);

  String[] words = {
    "Digital See World", "Open Day and Night", "We are Always Watching"
  };

  // Display words at x  location
  textFont(f, 36);        
  textAlign(LEFT);
  text(words[index], m, height*1/4); 
    
  // Decrement m
  m = m - 5;

  // If m is less than the negative width, 
  // then it is off the screen
  float w = textWidth(words[index]);
  if (m < -w) {
    m = width; 
    index = (index + 1) % words.length;
      
  }
}
