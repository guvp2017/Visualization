
// MSDS6390 Unit 6_Data Visulization Assignment_06 submission
// Group 8: Shanqing Gu, Brett Benefield 
// Date: 10/16/2018


// Method refer to: https://forum.processing.org/two/discussion/21552/create-graf-from-data-csv
// Sea ice and snow cover extent data from https://www.ncdc.noaa.gov/snow-and-ice/extent/
// Snow and ice image from: http://marinetechnologyinc.com/2013/12/go-fast-boat-winterization-tips/

// import package org.gicentre.utils.stat for supporting the creation of statistical graphics with Processing.
import org.gicentre.utils.stat.*;    
 
// use class XYChart for representing X-Y charts such as scatterplots or line charts.
XYChart iceSnowCover;
Glacier ice;

FloatList date;
FloatList value;
float currYear=-1;

float[][] kernel = { {0, 0, 0}, {0,  1, 0}, {0, 0, 0}}; // identity kernel 


// Initialises the sketch and loads data into the chart
void setup()
{
  size(1000, 500);   
  textFont(createFont("Arial",12),12); // set text font and size
  
  iceSnowCover = new XYChart(this); //XYChart
  ice = new Glacier(); // Melting Glacier
  date = new FloatList();
  value = new FloatList();
 
  String[] data = loadStrings("a8.csv");
  float[] year  = new float[data.length-1];
  float[] valueNew = new float[data.length-1];
  
  for (int i=0; i<data.length-1; i++)  //Skipping file header
  {
    String[] Column = data[i+1].split(",");
   
  println(i, Column[0],Column[1]); //print to check
    
    year[i]  = Float.parseFloat(Column[0]);
    valueNew[i] = Float.parseFloat(Column[1]);
    
    if (currYear==year[i]) {
      value.set(value.size()-1,value.get(value.size()-1)+year[i]);
    } else {
      currYear=year[i];
      date.append(year[i]);
      value.append(year[i]);
    }
  }
 
//print array's contents to check
for(int i=0;i<date.size(); i++){
  println(date.get(i) + "\t" + value.get(i));
}
 
 
 //set up data and all axis parameters
  iceSnowCover.setData(year, valueNew);
  
  iceSnowCover.showXAxis(true); 
  iceSnowCover.showYAxis(true); 
  iceSnowCover.setMinX(1975);
  iceSnowCover.setMaxX(2020);
  iceSnowCover.setMinY(2);
  iceSnowCover.setMaxY(9);
  
  iceSnowCover.setXFormat("0000");
 
 // set up axis labels
  iceSnowCover.setXAxisLabel("\n Date (Year)");
  iceSnowCover.setYAxisLabel("Snow Cover (million km^2)\n");
 
 // set up point color and size
  iceSnowCover.setPointColour(color(0, 0, 255)); //180, 50, 50, 100
  iceSnowCover.setPointSize(10);
 
 // set up line color and size
  iceSnowCover.setLineColour(color(137, 207, 240));
  iceSnowCover.setLineWidth(4);
}
 
// Draws the chart in the sketch 
void draw()
{
  background(255);
  
  snow_ice();
  textSize(12);
  iceSnowCover.draw(20,10,width-40,height-40);
  ice.update(); // draw triange
  
  fill(0,0,255);
  textSize(22);
  text("Sea Ice and Snow Cover Extent", width*2/3, height/10);
  
  // reduce dimensions to simulate melting
  if (frameCount % 30 == 0) {
    ice.melt();
  }
}






// Also tried real time data for temperature and humidity in area 43220, but the API has been stopped time by time.

// JSONObject json;

//  static final String
//  url = "http://" + "api.OpenWeatherMap.org" + "/data/2.5/weather" + '?', 
//  zip = "zip=43220" + '&' + ",us" + '&', 
//  api_key = "appid=1f4693da697e3dc92610bc2a538dd2c9" + '&', 
//  path = url + zip + api_key;

//JSONObject weather, main, dt;

//void setup() {
  
//  size(600,600);
//  background(255);
 
//  stroke(255);
//  fill(255);
//}

//void draw(){
  
//  weather = loadJSONObject(path);
//  final JSONObject main = weather.getJSONObject("main");
//  final float humidity = main.getFloat("humidity");
//  final float temp = main.getFloat("temp");
//  final float dt = weather.getFloat("dt");
 
//  beginShape();
//  stroke(0);
//  strokeWeight(10);
//  fill(0);
//  curveVertex(temp, humidity);
//  //curveVertex(dt, temp);
//  //bezier(100, 100, 90, 90, temp, humidity, temp, humidity);
  
//  endShape();
  
//  println("43220 Temperature and humidity are: " + temp +  "   " + humidity + "   " + dt);
//}

//// https://processing.org/tutorials/data/
