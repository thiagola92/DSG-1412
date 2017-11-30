import netP5.*;
import oscP5.*;

OscP5 osc;
NetAddress netAddress;

void createConnection() {
  OscMessage message;
  
  createOsc();
  
  netAddress = new NetAddress(computerIP, port);
  
}

void createOsc() {
  if (osc != null)
    osc.dispose();

  osc = new OscP5(this, port);
}