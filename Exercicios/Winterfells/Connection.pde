import netP5.*;
import oscP5.*;

OscP5 osc;

public class Connection {

  NetAddress netAddress;

  Connection(String ip) {    
    netAddress = new NetAddress(ip, port);
  }
}

void createConnections() {

  createOsc();

  connection.add(new Connection("192.168.0.122"));
  OscMessage message = new OscMessage("playerId");
  message.add(0);
  osc.send(message, connection.get(0).netAddress);
  
  connection.add(new Connection("192.168.0.184"));
  message = new OscMessage("playerId");
  message.add(1);
  osc.send(message, connection.get(1).netAddress);
}

void createOsc() {
  if (osc != null)
    osc.dispose();

  osc = new OscP5(this, port);
}

void oscEvent(OscMessage theOscMessage) {
  println("==============> recebeu mensagem");

  for (int i = 0; i < player.size(); i++) {
    if (theOscMessage.checkAddrPattern("/player" + i + "/")) {
      println(i);
    }
  }

  if (theOscMessage.checkTypetag("i")) {
    //println(theOscMessage.get(0).intValue());
  }
}