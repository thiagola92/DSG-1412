import netP5.*;
import oscP5.*;

OscP5 osc;

public class Connection {

  NetAddress netAddress;

  public Connection(String ip) {
    ip = ip.split("/")[1];  // For some reason the ip comes like "/192.168.0.1", so i have to remove the bar

    netAddress = new NetAddress(ip, port);

    OscMessage message = new OscMessage("id");
    message.add(connection.size());
    osc.send(message, netAddress);
  }

  public boolean compareIp(OscMessage theOscMessage) {
    String address = theOscMessage.address().split("/")[1];

    if (address.equals(netAddress.address()))
      return true;

    return false;
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

  //netAddress = new NetAddress("192.168.0.123", port);
  //connection.add(netAddress);
  //message = new OscMessage("playerId");
  //message.add(0);
  //osc.send(message, connection.get(0));

  //netAddress = new NetAddress("192.168.0.15", port);
  //connection.add(netAddress);
  //message = new OscMessage("playerId");
  //message.add(1);
  //osc.send(message, connection.get(1));
}

void createOsc() {
  if (osc != null)
    osc.dispose();

  osc = new OscP5(this, port);
}

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("join")) {
    
    if(connection.size() >= player.size())
      return;
      
    Connection c = new Connection(theOscMessage.address());
    connection.add(c);
    
  } else if (theOscMessage.checkAddrPattern("update")) {
    
    int i = discoverPlayer(theOscMessage);
    
    if(i < 0)
      return;
      
    float direction = theOscMessage.get(0).floatValue();
    player.get(i).setDirection(direction);
    
  }
  
}

int discoverPlayer(OscMessage theOscMessage) {
  
  for(int i = 0; i < connection.size(); i++) {
    Connection c = connection.get(i);
    
    if(c.compareIp(theOscMessage))
      return i;
      
  }
  
  return -1;
}