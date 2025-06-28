class Minute {

  int time;
  int temperature;
  float gravity;
  ArrayList<String> events;

  public Minute(int time, int temperature, float gravity, ArrayList<String> events) {
    this.time = time;
    this.temperature = temperature;
    this.gravity = gravity;
    this.events = new ArrayList<>();
    this.events = events;
  }

  void showMinute() {
    int xCircle = 150;
    int yCircle = 150;

    //Drawing the circle
    fill(255);
    strokeWeight(4);
    stroke(80);
    circle(xCircle, yCircle, 180);

    //Drawing the text
    fill(0);
    textAlign(CENTER);
    textSize(60);
    text(this.time + "'", xCircle, yCircle + 18);
  }

  void showTemperature() {
    int xTemp = 150;
    int yTemp = 400;
    int wRect = 46;
    int hRect = 200;

    //Drawing the variable rect
    rectMode(CORNER);
    strokeWeight(0);
    fill(0, 0, 5.1 * this.temperature + 306);
    rect(xTemp - wRect/2, yTemp + hRect/2, wRect, -(4 * this.temperature + 240)); //formule y = 4x + 240 pour remapper la température sur le rectangle

    //Drawing the base rect
    strokeWeight(4);
    stroke(80);
    fill(255, 20);
    rectMode(CENTER);
    rect(xTemp, yTemp, wRect, hRect);

    //Drawing the text below
    fill(0);
    textAlign(CENTER);
    textSize(45);
    text(this.temperature + "°C", xTemp, yTemp + 150);
  }

  void showGravity() {
    int xGrav = 150;
    int yGrav = 700;
    //Drawing the rectangle
    rectMode(CENTER);
    strokeWeight(4);
    stroke(80);
    if (gravity >= 1) {
      fill(150, 150, 255);
    } else {
      fill(0, 0, 255);
    }
    rect(xGrav, yGrav, 150, 80);

    //Drawing the gravity
    fill(0);
    textAlign(CENTER);
    textSize(40);
    strokeWeight(1);
    text(this.gravity, xGrav, yGrav + 10);

    //Drawing the text indication
    fill(0);
    textSize(26);
    text("Indice de gravité", xGrav, yGrav - 55);
  }

  void showEvents() {
    int xEvent = 350;
    int yEvent = 50;
    
    //Drawing the base rectangle
    rectMode(CORNER);
    strokeWeight(4);
    fill(255);
    stroke(80);
    rect(xEvent, yEvent, 800, 500);
    
    //Drawing the title text
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("Evènements", xEvent + 400, yEvent + 55);
    
    //Drawing the text events
    fill(0);
    textSize(28);
    textLeading(30);
    textAlign(LEFT);
    for (int i = 0; i < this.events.size(); i++) {
      text("- " + this.events.get(i), xEvent + 30, yEvent + 120  + 40 * i ); 
    }
  }


  int getTime() {
    return this.time;
  }

  int getTemp() {
    return this.temperature;
  }

  float getGravity() {
    return this.gravity;
  }

  ArrayList<String> getEvents() {
    return this.events;
  }
}
