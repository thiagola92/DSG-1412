import ketai.sensors.*;

KetaiSensor sensor;
Status status;
Keyboard keyboard;

int port = 17000;

void setup() {
  fullScreen();

  createOsc();

  status = new Status();
  sensor = new KetaiSensor(this);
  keyboard = new Keyboard();
  
  sensor.start();
  orientation(LANDSCAPE);  // This last
}

void draw() {
  background(status.rgb);

  if (netAddress != null) {
    OscMessage message = new OscMessage("update");
    message.add(status.accelerometerY);
    osc.send(message, netAddress);
  }

  status.draw();
}

void mousePressed() {
  openKeyboard();
}


void keyPressed() {
  keyboard.writeName();
}


void onAccelerometerEvent(float x, float y, float z) {
  status.accelerometerY = y;
}

void mousePressed () {
  keyboard.beginKeyboard();
}

void keyPressed () {
  keyboard.writing();
}