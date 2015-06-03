//används om datan ska läsas "live" eller från fil

class DataFetcher {
  UnfoldingMap map;
  int r;
  int cols;
  int rows;
  Table file;

  DataFetcher() {
  }

  DataFetcher(UnfoldingMap map_, int cols_, int rows_, int resolution) {
    map = map_;
    r = resolution;
    cols = cols_;
    rows = rows_;
    file = loadTable("201563185634.csv", "header");
  }

  float[] getFromOpenWeather(int col, int row) {
    float[] fromOpenWeather = new float[2];

    //ta reda på lat long
    Location location = map.getLocation(col*r, row*r);

    //parsa openweather JSON
    JSONObject loc;
    //try {
    loc = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?lat="+location.getLat()+"&lon="+location.getLon());
    // }
    // catch(IOException e) {

    //   loc = null;
    //}

    float speed;
    float deg;
    if (loc != null) {
      JSONObject wind = loc.getJSONObject("wind");
      speed = wind.getFloat("speed");
      deg = wind.getFloat("deg");
    } else {
      speed = 0.0;
      deg = 0.0;
    }

    fromOpenWeather[0] = speed;
    fromOpenWeather[1] = deg;

    return fromOpenWeather;
  }

  float[] getFromFile(int col, int row) {
    float[] fromFile = new float[2];

    
    TableRow rowGotten = file.getRow((row*cols)+col);
    fromFile[0] = rowGotten.getFloat("speed");
    fromFile[1] = rowGotten.getFloat("deg");

    return fromFile;
  }

  PVector getVector(float[] wind) {
    float speed = wind[0];
    float deg = wind[1];
    PVector vector = new PVector();
    vector = PVector.fromAngle(radians(deg));
    vector.setMag(speed);

    return vector;
  }



  PVector getVector(int col, int row) {
    //ta reda på lat long
    Location location = map.getLocation(col*r, row*r);

    //parsa openweather JSON
    JSONObject loc;
    //try {
    loc = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?lat="+location.getLat()+"&lon="+location.getLon());
    // }
    // catch(IOException e) {

    //   loc = null;
    //}

    float speed;
    float deg;
    if (loc != null) {
      JSONObject wind = loc.getJSONObject("wind");
      speed = wind.getFloat("speed");
      deg = wind.getFloat("deg");
    } else {
      speed = 0.0;
      deg = 0.0;
    }

    ////// lägg till errorhandling, typ skit i den om den inte går att ladda

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

    println("#"+(row*cols+col)+"/"+cols*rows+" ok! "+ second());

    return theWind;
  }
}
