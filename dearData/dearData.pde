
Table table;
Illustration illustration;
Illustration[] illustrations;
int[] wakeUps;
int[] asleeps;


void setup() {
  size(1000, 1000);
  // Load in the csv formatted data about sleep duration and subjective sleep score.
  // Data was extracted from garmin and preformatted using an open-sourced garmin API
  table = loadTable("newdata.csv", "header");
  illustrations = new Illustration[table.getRowCount()];

  // Loop over each row in the imported CSV table and extract rating, index, sleepDuration, fellAsleep and wokeUp.
  for (TableRow row : table.rows()) {
    int rating = row.getInt("rating");
    int index = row.getInt("index");
    int duration = row.getInt("sleepDuration");
    String[] fellAsleep = row.getString("fellAsleep").split(":");
    // Conversion from timestamp to minutes for ease of use with illustration later
    int fellAsleepMinutes = (Integer.parseInt(fellAsleep[0])*60) + Integer.parseInt(fellAsleep[1]);
    String[] wokeUp = row.getString("wokeUp").split(":");
    // Also conversion from timestamp to minute
    int wokeUpMinutes = (Integer.parseInt(wokeUp[0])*60) + Integer.parseInt(wokeUp[1]);
    
    // Initializes an illustration with the current extracted data, and stores it in an array of illustrations (really jank way of calculating positions)
    illustrations[index] = new Illustration(index*22, duration/60, rating, fellAsleepMinutes, wokeUpMinutes);
  }
}

void draw() {
  // Draw each illustration of the data once per fram (Kind of really unneccesarry way to do it since the data is never updated)
  for (Illustration illustration : illustrations) {
    illustration.draw();
  }
}
