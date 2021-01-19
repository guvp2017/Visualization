

// https://earthobservatory.nasa.gov/images/77270/oldest-arctic-sea-ice-is-disappearing
// https://github.com/shiffman/LearningProcessing/blob/master/chp15_images_pixels/exercise_15_05_image_seq/Sequence.pde

 class Image {
  int maxImages = 3; 
  int imageIndex = 0; 

  // Declaring an array of images
  PImage[] images = new PImage[maxImages];

  Image() {   
   
    // Loading the images into the array
    for (int i = 0; i < images.length; i ++ ) {
      images[i] = loadImage( "seaIceAge_" + (i+1) + ".jpg" ); 
    }
    
    imageIndex = int(random(images.length));
  }

  void display() {
    
    image(images[imageIndex], 50, 50, width-100, height-100);
  }
  
  void next() {
    imageIndex = (imageIndex + 1) % images.length;
  }
}
