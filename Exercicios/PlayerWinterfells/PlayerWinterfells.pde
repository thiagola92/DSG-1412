import netP5.*;
import oscP5.*;
import ketai.sensors.*;

OscP5 osc;
NetAddress netAddress;
KetaiSensor accelerometer;
Status status;

int port = 17000;
String computerIP = "192.168.0.10";

void setup() {
  fullScreen();
  
  osc = new OscP5(this, port);
  netAddress = new NetAddress(computerIP, port);
  accelerometer = new KetaiSensor(this);
  status = new Status();
  accelerometer.start();
  
  orientation(LANDSCAPE);  // This last
}

void draw() {
  background(0);
  
  OscMessage message = new OscMessage("movement");
  message.setAddrPattern("/player" + status.playerId + "/");
  message.add(status.accelerometerY);
  osc.send(message, netAddress);
  
  status.draw();
  
  
}

void oscEvent(OscMessage theOscMessage) {
  
  if(theOscMessage.checkTypetag("i")) {
    status.playerId = theOscMessage.get(0).intValue();
  }
  
}

void onAccelerometerEvent(float x, float y, float z) {
  status.accelerometerY = y;
}