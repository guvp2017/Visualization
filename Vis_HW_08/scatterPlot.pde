
// Scatterplot class with XYChart library

import org.gicentre.utils.stat.*;  

class ScatterPlot {
  XYChart scatterPlot;
 
  // Load in data from a file 
  FloatList date;
  FloatList value;
  String[] data;
  float[] date2;
  float[] value2;
  
  ScatterPlot() throws Exception {
    throw new Exception("ScatterPlot() constructor expects XYChart");
  }
     
  ScatterPlot(XYChart scatterPlot) {     
    this.scatterPlot = scatterPlot;
    
    date = new FloatList();
    value = new FloatList();
    
    data = loadStrings("MyData.csv");
    date2  = new float[data.length-1];
    value2 = new float[data.length-1];
        
    this.initialize();
  }
    
  void initialize() { 
    for (int i=0; i<data.length-1; i++) {
      String[] Column = data[i+1].split(",");
      date2[i]  = Float.parseFloat(Column[0]);
      value2[i] = Float.parseFloat(Column[1]);
    } 
    
    scatterPlot.setData(date2, value2);
    
    // Axis formatting and labels.
    scatterPlot.showXAxis(true); 
    scatterPlot.showYAxis(true); 
    scatterPlot.setXFormat("0000");
    scatterPlot.setXAxisLabel("\n Date (Year)");
    scatterPlot.setYAxisLabel("Snow Cover (million km^2)\n");
    
    scatterPlot.setMinX(1979);
    scatterPlot.setMaxX(2018);
    scatterPlot.setMinY(3.8);
    scatterPlot.setMaxY(9);
    
    // Symbol styles
    scatterPlot.setPointColour(color(250,50,250));
    scatterPlot.setPointSize(15);
  }
  
  void display(){
    scatterPlot.draw(40, 40, width-80, height-80);
  }
}
