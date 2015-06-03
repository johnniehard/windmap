//används för att spara till fil

class DataSaver extends DataFetcher {
  Table table;

  DataSaver(UnfoldingMap map_, int cols_, int rows_, int resolution) {
    map = map_;
    r = resolution;
    cols = cols_;
    rows = rows_;

    table = new Table();
    table.addColumn("id");
    table.addColumn("speed");
    table.addColumn("deg");
  }

  void addVector(int col, int row) {
    PVector wind = getVector(getFromOpenWeather(col, row));
    TableRow newRow = table.addRow();
    newRow.setInt("id", table.getRowCount() - 1);
    newRow.setFloat("speed", wind.mag());
    newRow.setFloat("deg", degrees(wind.heading()));
    println(newRow.getInt("id")+"/"+(rows*cols));
  }

  void saveIt() {
    saveTable(table, "data/"+ year()+""+month()+""+day()+""+hour()+""+minute()+""+second() +".csv");
    println("datasaved!!!");
  }
}
