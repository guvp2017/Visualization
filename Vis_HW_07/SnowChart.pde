
// snowChart class with XYChart library

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
    
    data = loadStrings("a8.csv");
    year  = new float[data.length-1];
    valueNew = new float[data.length-1];
    
    this.initialize();
    // textFont(createFont("Arial",12),12); // set text font and size
  }

  void initialize() {
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
  
  void drawChart(int xPos, int yPos, int chartWidth, int chartHeight) {
    textSize(16); // define the font size in chart 
    iceSnowCover.draw(xPos, yPos, chartWidth, chartHeight);
  }
}

//
