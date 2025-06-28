ArrayList<Minute> allMinutes = new ArrayList<>();
int present;

//Loading the objects from the JSON file into an arrayList
ArrayList<Minute> loadMinutesFromJSON(String filename) {
  ArrayList<Minute> loadedMinutes = new ArrayList<>();

  JSONArray jsonArray = loadJSONArray(filename);

  for (int i = 0; i < jsonArray.size(); i++) {
    JSONObject json = jsonArray.getJSONObject(i);

    int time = json.getInt("time");
    int temperature = json.getInt("temperature");
    float gravity = json.getFloat("gravity");

    ArrayList<String> events = new ArrayList<>();
    JSONArray jsonEvents = json.getJSONArray("events");
    for (int j = 0; j < jsonEvents.size(); j++) {
      events.add(jsonEvents.getString(j));
    }

    Minute m = new Minute(time, temperature, gravity, events);
    loadedMinutes.add(m);
  }

  return loadedMinutes;
}

void setup() {
  size(1200, 800);

  allMinutes = loadMinutesFromJSON("minutes.json");
  present = 0;

  background(200);
}

void draw() {
  background(200);
  allMinutes.get(present).showMinute();
  allMinutes.get(present).showTemperature();
  allMinutes.get(present).showGravity();
  allMinutes.get(present).showEvents();

  showNextButton();
  showPreviousButton();
  showResetButton();
}

void mouseClicked() {
  //Next Button detection
  if (mouseX > 1050 - wButton/2 && mouseX < 1050 + wButton/2 && mouseY > yButton - hButton/2 && mouseY < yButton + hButton/2) {
    if (present < 18) {
      present++;
    } else {
      present = 0;
    }
  }

  //Previous Button detection
  if (mouseX > 450 - wButton/2 && mouseX < 450 + wButton/2 && mouseY > yButton - hButton/2 && mouseY < yButton + hButton/2) {
    if (present > 0) {
      present--;
    } else {
      present = 0;
    }
  }

  //Respawn Button detection
  if (mouseX > 750 - wButton/2 && mouseX < 750 + wButton/2 && mouseY > yButton - hButton/2 && mouseY < yButton + hButton/2) {
    present = 0;
  }
}

int yButton = 660;
int wButton = 200;
int hButton = 180;

void showNextButton() {
  //Rectangle
  rectMode(CENTER);
  strokeWeight(4);
  stroke(80);
  fill(180, 0, 0);
  rect(1050, yButton, wButton, hButton);

  //Text
  textAlign(CENTER);
  textSize(40);
  fill(255);
  text("NEXT", 1050, yButton + 15);
}

void showPreviousButton() {
  rectMode(CENTER);
  strokeWeight(4);
  stroke(80);
  fill(180, 0, 0);
  rect(450, yButton, wButton, hButton);

  //Text
  textAlign(CENTER);
  textSize(40);
  fill(255);
  text("PREVIOUS", 450, yButton + 15);
}

void showResetButton() {
  rectMode(CENTER);
  strokeWeight(4);
  stroke(80);
  fill(0, 255, 0);
  rect(750, yButton, wButton, hButton);

  //Text
  textAlign(CENTER);
  textSize(40);
  fill(255);
  text("RESPAWN", 750, yButton + 15);
}
