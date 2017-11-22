import netP5.*;
import oscP5.*;

public class Connection {
  
  int port = 17000;
  
  OscP5 osc;
  ArrayList<NetAddress> netAddress;

  void Connection() {
    osc = new OscP5(this, port);
    netAddress = new ArrayList<NetAddress>();
  }
  
}

void oscEvent(OscMessage theOscMessage) {
}