import netP5.*;
import oscP5.*;

OscP5 osc;

public class Connection {

  NetAddress netAddress;

  public Connection(String ip) {
    int index = connection.size();

    ip = ip.split("/")[1];  // For some reason the ip comes like "/192.168.0.1", so i have to remove the bar

    netAddress = new NetAddress(ip, port);

    OscMessage message = new OscMessage("id");
    message.add(index);
    message.add(player.get(index).rgb);
    osc.send(message, netAddress);
}

  public boolean compareIp(OscMessage theOscMessage) {
    String address = theOscMessage.address().split("/")[1];

    if (address.equals(netAddress.address()))
      return true;

    return false;
  }

  public void endConnection() {
    OscMessage message = new OscMessage("end");
    osc.send(message, netAddress);
  }
}

void createConnections() {
  OscMessage message;
  NetAddress netAddress;

  createOsc();

  for (int i = 0; i < 256; i++) {
    netAddress = new NetAddress("192.168.0." + i, port);
    message = new OscMessage("start");
    osc.send(message, netAddress);
  }
}

void createOsc() {
  if (osc != null)
    osc.dispose();

  osc = new OscP5(this, port);
}

void oscEvent(OscMessage theOscMessage) {
  //if (!theOscMessage.checkAddrPattern("update"))
  //  println(theOscMessage.address(), theOscMessage.addrPattern());

  if (theOscMessage.checkAddrPattern("join")) {
    addPlayer(theOscMessage);
  } else if (theOscMessage.checkAddrPattern("update")) {
    updatePlayer(theOscMessage);
  }
}

void addPlayer(OscMessage theOscMessage) {

  if (connection.size() < player.size()) {
    String name = theOscMessage.get(0).stringValue();
    score.get(connection.size()).playerName = name;
    
    Connection c = new Connection(theOscMessage.address());
    connection.add(c);
  }
}

void updatePlayer(OscMessage theOscMessage) {

  int i = discoverPlayer(theOscMessage);

  if (i >= 0) {
    float direction = theOscMessage.get(0).floatValue();
    player.get(i).setDirection(direction);
  }
}

int discoverPlayer(OscMessage theOscMessage) {
  
  for (int i = 0; i < connection.size(); i++) {
    Connection c = connection.get(i);
  
    if (c.compareIp(theOscMessage))
      return i;
  }
  
  return -1;
}

void endConnections() {
  
  for (int i = 0; i < connection.size(); i++) {
    connection.get(i).endConnection();
  }
}