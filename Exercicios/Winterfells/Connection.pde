import netP5.*;
import oscP5.*;

OscP5 osc;

public class Connection {
  
  NetAddress netAddress;

  Connection(String ip) {
    println("==============> criando conexao " + ip);
    
    netAddress = new NetAddress(ip, port);
  }
}

void createConnections() {
  println("==============> criando conexoes");
  
  createOsc();

  connection.add(new Connection("192.168.0.21"));
}

void createOsc() {
  if(osc != null)
    osc.dispose();
  
  osc = new OscP5(this, port);
}

void oscEvent(OscMessage theOscMessage) {
  println("==============> recebeu mensagem");
}