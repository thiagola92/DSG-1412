import netP5.*;
import oscP5.*;

public class Connection {
  
  int port = 17000;
  
  OscP5 osc;
  NetAddress[] netAddress;

  void Connection() {
    osc = new OscP5(this, port);
    netAddress = new NetAddress[numberOfPlayers];
  }
  
}

void oscEvent(OscMessage theOscMessage) {
}