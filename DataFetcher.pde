class DataFetcher{
  UnfoldingMap map;
  int r;
  
 DataFetcher(UnfoldingMap map_, int cols, int rows, int resolution){
   map = map_;
   r = resolution;
   println(r);
 }
 
 PVector getVector(int col, int row){
   //ta reda på lat long
   Location location = map.getLocation(col*r, row*r);
   
   //parsa openweather JSON
   JSONObject loc = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?lat="+location.getLat()+"&lon="+location.getLon());
   JSONObject wind = loc.getJSONObject("wind");
   float speed = wind.getFloat("speed");
   float deg = wind.getFloat("deg");
   
   //räkna om grader och styrka
   /*
   PVector test = new PVector();
   test = PVector.fromAngle(radians(143.002));
   test.setMag(0.5);
   println(test);
   */
   PVector theWind = new PVector();
  theWind = PVector.fromAngle(radians(deg));
   theWind.setMag(speed);
   
   println("ok! "+ second());
   
   return theWind;
 }
   
}
