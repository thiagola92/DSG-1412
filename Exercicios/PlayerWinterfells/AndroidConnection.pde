import netP5.*;
import oscP5.*;

OscP5 osc;
NetAddress netAddress;

int playerId = -1;
int port = 17000;
String computerIP = "192.168.0.185";

void setup() {
  fullScreen();
  
  osc = new OscP5(this, port);
  netAddress = new NetAddress(computerIP, port);
}

void draw() {
  background(0);
  
  OscMessage message = new OscMessage("movement");
  message.setAddrPattern("/player" + playerId + "/");
  message.add(playerId);
  osc.send(message, netAddress);
  
  textSize(30);
  text(playerId, width/2, height/2);
  
}

void oscEvent(OscMessage theOscMessage) {
  
  if(theOscMessage.checkTypetag("i")) {
    playerId = theOscMessage.get(0).intValue();
  }
  
}