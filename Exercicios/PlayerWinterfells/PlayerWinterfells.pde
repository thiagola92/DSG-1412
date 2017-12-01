import netP5.*;
import oscP5.*;
import ketai.sensors.*;

KetaiSensor accelerometer;
Status status;

int port = 17000;
String computerIP = "192.168.0.10";

void setup() {
  fullScreen();
  
  createOsc();
  
  accelerometer = new KetaiSensor(this);
  status = new Status();
  
  accelerometer.start();
  
  orientation(LANDSCAPE);  // This last
}

void draw() {
  background(0);
  
  if(netAddress != null) {
    OscMessage message = new OscMessage("update");
    message.add(status.accelerometerY);
    osc.send(message, netAddress);
  }
  
  status.draw();
  
}

void onAccelerometerEvent(float x, float y, float z) {
  status.accelerometerY = y;
}