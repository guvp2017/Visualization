
// Sea ice and snow cover extent data from https://www.ncdc.noaa.gov/snow-and-ice/extent/

class MyData{
  
  String[] date;
  float[] value; 
  float[] anomaly;
  String path;
  
  MyData(){
  }
  
  MyData(String path){
    this.path = path;
    
    init(path);
  }
  
  void init(String path){
    Table df = loadTable(path,"header,csv"); 
    
    date = new String[df.getRowCount()];
    value = new float[df.getRowCount()];
    anomaly = new float[df.getRowCount()];
    
    int i = 0;
    float temp = 0;
    
    for(TableRow row : df.rows()){
      
      date[i] = row.getString("Date");
      value[i] = row.getFloat("Value");
      anomaly[i] = row.getFloat("Anomaly");
      temp += row.getFloat("Value");         
      i++;
    }
  }
}
