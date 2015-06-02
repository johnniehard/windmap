class DataFetcher {
  UnfoldingMap map;
  int r;
  int cols;
  int rows;

  DataFetcher(UnfoldingMap map_, int cols_, int rows_, int resolution) {
    map = map_;
    r = resolution;
    cols = cols_;
    rows = rows_;
  }

  PVector getVector(int col, int row) {
    //ta reda på lat long
    Location location = map.getLocation(col*r, row*r);

    //parsa openweather JSON
    // try {
    JSONObject loc = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?lat="+location.getLat()+"&lon="+location.getLon());
    // }
    // catch(UnknownHostException e) {

    //     JSONObject loc = null;
    //   }

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

    println("#"+col*row+"/"+cols*rows+" ok! "+ second());

    return theWind;
  }
}
