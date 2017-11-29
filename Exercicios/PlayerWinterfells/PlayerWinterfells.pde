import netP5.*;
import oscP5.*;
import ketai.sensors.*;

OscP5 osc;
NetAddress netAddress;
KetaiSensor accelerometer;
View view;

int playerId = -1;
int port = 17000;
String computerIP = "192.168.0.185";
float accY;

void setup() {
  fullScreen();
  
  osc = new OscP5(this, port);
  netAddress = new NetAddress(computerIP, port);
  accelerometer = new KetaiSensor(this);
  view = new View();
  accelerometer.start();
  orientation(LANDSCAPE);
}

void draw() {
  background(0);
  
  OscMessage message = new OscMessage("movement");
  message.setAddrPattern("/player" + playerId + "/");
  message.add(accY);
  osc.send(message, netAddress);
  
  view.draw();
  
  
}

void oscEvent(OscMessage theOscMessage) {
  
  if(theOscMessage.checkTypetag("i")) {
    playerId = theOscMessage.get(0).intValue();
  }
  
}

void onAccelerometerEvent(float x, float y, float z) {
  accY = y;
}