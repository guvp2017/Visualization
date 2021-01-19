
// Barcharts class with BarChart library

import org.gicentre.utils.stat.*;  

class BarCharts{
  
  //fields
  
  BarChart barChartValue;
  BarChart barChartAnomaly; 
  
  MyData data;
  String path;
  
  //cstrs
  BarCharts(){
  }
  
  BarCharts(String path, BarChart barChartValue, BarChart barChartAnomaly){
    this.path = path;
    this.barChartValue = barChartValue;
    this.barChartAnomaly = barChartAnomaly;
    
    data = new MyData(path);
    init(barChartValue, data.value, color(114, 147, 203));  
    init(barChartAnomaly, data.anomaly, color(225, 151, 76)); 
  }
  
  void init(BarChart barChart, float[] x, color barColor){
    textFont(createFont("Serif", 10), 10);
    
    barChart.setData(x);
    barChart.setBarLabels(data.date);
    
    barChart.setMinValue(-5);
    barChart.setMaxValue(10);
    barChart.setCategoryAxisLabel("\n Date (Year)");
    barChart.setValueAxisLabel("Snow Cover (million km^2)\n");
    barChart.setBarColour(barColor);
    barChart.showCategoryAxis(true);
    barChart.showValueAxis(true);   
  }
  
  void display(){
    barChartValue.draw(40, 40, width-80, height-80);
    barChartAnomaly.draw(40, 40, width-80, height-80);
    
    // Draw a title over the top of the chart    
    fill(255);
    textSize(22);
    text("Sea Ice and Snow Cover Extent from 1979 to 2018", width/3, height/11);    
   
    displayLegend();
  }
  
  void displayLegend(){
    textSize(20);
    
    fill(114, 147, 203);
    rect(width-150, height/10, 20, 20);
    
    fill(125);
    text("V", width-120, height/10+7);
       
    fill(225, 151, 76);
    rect(width-150, height/10+25, 20, 20);
    
    fill(125);
    text("A", width-120, height/10+26, 20, 20);   
  }
}
