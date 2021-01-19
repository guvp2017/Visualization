
// HW_01: Painting Recreation for Visualization of Information by Shanqing Gu (09/02/2018)

// The original paint is from website: https://assets.saatchiart.com/saatchi/820158/art/3262689/2332576-VSLUHHTS-7.jpg
// The original paint can also be found from website: https://www.saatchiart.com/art/Collage-Suprematist-Composition-Homage-to-Malevich/820158/3071930/view
// Use ImageJ to measure the object positions
// Use online tool to get object RGB values (https://imagecolorpicker.com)

void setup()
{
  size(750,950);
  //translate and rotate steps after finishing the painting
  translate(150,-100); // Position the painting after rotation
  rotate(radians(20)); // Rotation for easy painting 
  
  // Paint all objects
  
  fill(22,10,11);
  ellipse(49, 269, 36, 36);
  ellipse(173, 245, 56, 56);
  ellipse(141, 361, 80, 80);
  
  fill(229,225,125);
  noStroke();
  rect(290, 258, 61, 150);
  
  fill(167, 35, 43);
  noStroke();
  rect(192, 405, 20, 500);
  
  fill(167, 35, 43);
  noStroke();
  rect(192, 405, 20, 500);
  
  fill(39, 92, 124);
  noStroke();
  rect(212, 405, 140, 140);
  
  fill(21, 10, 11);
  noStroke();
  arc(192, 477, 143, 143, radians(90), radians(270));
  
  fill(21, 10, 11);
  noStroke();
  rect(212, 689, 70, 216);
  
  fill(34, 16, 6);
  noStroke();
  rect(352, 173, 16, 582);
  
  fill(35, 84, 98);
  noStroke();
  rect(286, 652, 66, 34);
  
  fill(213, 35, 63);
  noStroke();
  rect(368, 79, 30, 182);
  
  fill(28, 92, 120);
  noStroke();
  rect(368, 251, 143, 68);
  
  fill(21, 10, 11);
  noStroke();
  arc(398, 252, 143, 143, radians(270), radians(360));
  
  fill(218, 216, 82);
  noStroke();
  rect(368, 548, 65, 103);
  
  fill(13, 7, 11);
  noStroke();
  arc(433, 548, 120, 120, radians(-90), radians(90));
  
  fill(31, 24, 19);
  noStroke();
  rect(368, 319, 270, 16);
  
  fill(161, 27, 40);
  noStroke();
  rect(622, 335, 16, 236);
  
  fill(10, 9, 5);
  noStroke();
  rect(638, 467, 52, 104);
  
  fill(14, 128, 24);
  noStroke();
  arc(634, 702, 130, 130, radians(0), radians(180));
  
  fill(188, 16, 45);
  noStroke();
  arc(699, 702, 130, 130, radians(180), radians(360));
  
  fill(36,164,66);
  noStroke();
  rotate(radians(-20));
  rect(150,200, 70, 70);
}
