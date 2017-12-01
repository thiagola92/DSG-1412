import netP5.*;
import oscP5.*;
import ketai.sensors.*;

KetaiSensor accelerometer;
Status status;
Keyboard keyboard;

int port = 17000;

void setup() {
  fullScreen();

  createOsc();

  accelerometer = new KetaiSensor(this);
  status = new Status();
  keyboard = new Keyboard();

  accelerometer.start();

  orientation(LANDSCAPE);  // This last
}

void draw() {
  background(status.playerColor);

  if (netAddress != null) {
    OscMessage message = new OscMessage("update");
    message.add(status.accelerometerY);
    osc.send(message, netAddress);
  }

  status.draw();
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