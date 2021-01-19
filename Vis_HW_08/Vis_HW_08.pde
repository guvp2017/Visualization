// MSDS6390 Assignment 8: 2Week Mid-Term Data Visulization Project
// Group 8: Shanqing Gu, Brett Benefield 
// Date: 11/06/2018

// Method refer to: https://forum.processing.org/two/discussion/21552/create-graf-from-data-csv
// Sea ice and snow cover extent data from https://www.ncdc.noaa.gov/snow-and-ice/extent/
// Snow and ice image from: http://marinetechnologyinc.com/2013/12/go-fast-boat-winterization-tips/

// import package org.gicentre.utils.stat for supporting the creation of statistical graphics with Processing (import org.gicentre.utils.stat.*)

color bgCol = #111122;
Menu menu;

SnowChart snowChart;
ScatterPlot scatterPlot;
Image image;

BarCharts barCharts;
BarChart barChartValue;
BarChart barChartAnomaly;

ArrayList<Snow> snow = new ArrayList<Snow>(); // Snow arraylist for class object

// Initialize the sketch with size 1430x802
void setup(){  
  size(1430, 802);
  
  String[] labels = {
    "Snow Cover Extent", "Bar Charts", "Line Chart", "Scatter Plot"
  };  
  
  color[] states = {
    //offState, onState, overState, pressState
    #eebfbb, bgCol, #eeffef, #ffaa66
  };
  
  menu = new Menu(Layout.TOP, new Dimension(width, 23), labels, states, ButtonType.RECT);
  
  // Initialize the objects
  snowChart = new SnowChart(new XYChart(this));  
  scatterPlot = new ScatterPlot(new XYChart(this));
  image = new Image();
   
  barChartValue = new BarChart(this);
  barChartAnomaly = new BarChart(this);
  barCharts = new BarCharts("MyData.csv", barChartValue, barChartAnomaly);
    
  for (int i = 0; i < 150; i++) {
    snow.add(new Snow());
  }
}
 
// Draws the sketch 
void draw(){
  background(bgCol);
  
  
  //// create snowflake structures
  for (Snow snow: snow) {
    snow.draw();
  }
  
  menu.display();
  
  if (menu.getSelected() == "Snow Cover Extent"){
    image.display();
  } else if (menu.getSelected() == "Bar Charts"){
    barCharts.display();
  } else if (menu.getSelected() == "Line Chart"){
    snowChart.display();
  } else if (menu.getSelected() == "Scatter Plot"){
    scatterPlot.display();
  }
}
  
