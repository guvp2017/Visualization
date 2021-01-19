
// snowChart class with XYChart library

import org.gicentre.utils.stat.*;  

class SnowChart {
  XYChart iceSnowCover;  
  
  FloatList date;
  FloatList value;
  String[] data;
  float[] year;
  float[] valueNew;
  float currYear;
  
  SnowChart() throws Exception {
    throw new Exception("SnowChart() constructor expects XYChart");
  }
  
  SnowChart(XYChart snowChart) {
    iceSnowCover = snowChart;
    
    date = new FloatList();
    value = new FloatList();
    
    data = loadStrings("MyData.csv");
    year  = new float[data.length-1];
    valueNew = new float[data.length-1];
    
    this.initialize();
    // textFont(createFont("Arial",12),12); // set text font and size
  }

  void initialize() {
    
    // Draw a title over the top of the chart    
    fill(255);
    textSize(22);
    text("Sea Ice and Snow Cover Extent from 1979 to 2018", width/3, height/11);   
    
    for (int i=0; i<data.length-1; i++) {
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
      } // end if
    } // end for

 
    //print array's contents to check
    for(int i=0;i<date.size(); i++){
      println(date.get(i) + "\t" + value.get(i));
    }
    
    //set up data and all axis parameters
    iceSnowCover.setData(year, valueNew);
    
    iceSnowCover.showXAxis(true); 
    iceSnowCover.showYAxis(true); 
    iceSnowCover.setMinX(1979);
    iceSnowCover.setMaxX(2018);
    iceSnowCover.setMinY(3.8);
    iceSnowCover.setMaxY(9);
    
    iceSnowCover.setXFormat("0000");
   
    // set up axis labels
    iceSnowCover.setXAxisLabel("\n Date (Year)");
    iceSnowCover.setYAxisLabel("Snow Cover (million km^2)\n");
   
    // set up point color and size
    iceSnowCover.setPointColour(color(0, 0, 255)); //180, 50, 50, 100
    iceSnowCover.setPointSize(15);
   
    // set up line color and size
    iceSnowCover.setLineColour(color(137, 207, 240));
    iceSnowCover.setLineWidth(5);    
      
  }
  
   void display(){   
   iceSnowCover.draw(40, 40, width-80, height-80);
   }
}
   
