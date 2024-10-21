
Table table;
Illustration illustration;
Illustration[] illustrations;
int[] wakeUps;
int[] asleeps;


void setup() {
  size(1000, 1000);
  table = loadTable("data.csv", "header");
  illustrations = new Illustration[table.getRowCount()];

  for (TableRow row : table.rows()) {
    int rating = row.getInt("rating");
    int index = row.getInt("index");
    int hours = row.getInt("hours");
    int minutes = row.getInt("minutes");
    String[] fellAsleep = row.getString("fellAsleep").split(":");
    int fellAsleepMinutes = (Integer.parseInt(fellAsleep[0])*60) + Integer.parseInt(fellAsleep[1]);
    String[] wokeUp = row.getString("wokeUp").split(":");
    int wokeUpMinutes = (Integer.parseInt(wokeUp[0])*60) + Integer.parseInt(wokeUp[1]);
    
    illustrations[index] = new Illustration(index*100, (hours*60)+minutes, rating, fellAsleepMinutes, wokeUpMinutes);
  }
}

void draw() {
  for (Illustration illustration : illustrations) {
    illustration.draw();
  }
}
