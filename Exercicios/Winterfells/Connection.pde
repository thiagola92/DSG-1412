import netP5.*;
import oscP5.*;

OscP5 osc;

void createConnections() {
  OscMessage message;
  NetAddress netAddress;

  createOsc();

  netAddress = new NetAddress("192.168.0.123", port);
  connection.add(netAddress);
  message = new OscMessage("playerId");
  message.add(1);
  osc.send(message, connection.get(0));
  
  netAddress = new NetAddress("192.168.0.15", port);
  connection.add(netAddress);
  message = new OscMessage("playerId");
  message.add(0);
  osc.send(message, connection.get(1));
}

void createOsc() {
  if (osc != null)
    osc.dispose();

  osc = new OscP5(this, port);
}

void oscEvent(OscMessage theOscMessage) {

  for (int i = 0; i < player.size(); i++) {
    if (theOscMessage.checkAddrPattern("player" + i)) {
      player.get(i).setDirection(theOscMessage.get(0).floatValue());
      println(i, theOscMessage.get(0).floatValue());
    }
  }
}