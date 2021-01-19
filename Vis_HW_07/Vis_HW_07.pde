
// MSDS6390 Unit 7_Data Visulization Assignment_07_OOP Project submission
// Group 8: Shanqing Gu, Brett Benefield 
// Date: 10/23/2018


// Method refer to: https://forum.processing.org/two/discussion/21552/create-graf-from-data-csv
// Sea ice and snow cover extent data from https://www.ncdc.noaa.gov/snow-and-ice/extent/
// Snow and ice image from: http://marinetechnologyinc.com/2013/12/go-fast-boat-winterization-tips/

// import package org.gicentre.utils.stat for supporting the creation of statistical graphics with Processing.
import org.gicentre.utils.stat.*;    

SnowChart snowChart;
SnowImage snowImg;

ArrayList<SnowFlake> snow = new ArrayList<SnowFlake>(); // Snow arraylist for class object

// Initialize the sketch with size 1000x500
void setup()
{
  size(1000, 500);
  
  // Initialize the XYChart object
  snowChart = new SnowChart(new XYChart(this)); 
  
  // create moving image structures to show the oldest arctic sea ice is disappearing
  snowImg = new SnowImage("seaIceAge_1.jpg", "seaIceAge_2.jpg", width, height);
  
  // Initialize the snowflake object
  for (int i = 0; i < 150; i++) {
    snow.add(new SnowFlake(width, height, 15));
  }
}
 
// Draws the sketch 
void draw()
{
  background(255);
  
  // Update snow images
  snowImg.updateImage();
  
  // create XYChart structure for presenting the snow and ice extents from years 1970 to 2018
  snowChart.drawChart(20,10,width-40,height-40);  
  
  // create snowflake structures
  for (SnowFlake tempFlake: snow) {
    tempFlake.drawFlake();
  }
  
  // add title to the sketch 
  fill(255);
  textSize(22);
  text("Sea Ice and Snow Cover Extent from 1979 to 2012", width/3-60, height/11);
}

//
