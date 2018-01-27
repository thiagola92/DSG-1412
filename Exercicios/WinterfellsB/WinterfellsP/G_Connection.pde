public class Connection {

  String serverIP;

  public OscP5 osc = null;

  public Connection() {
    osc = new OscP5(this, settings.port);
  }
  
  public void close() {
    osc.dispose();
    osc = null;
  }

  /****************** Sending message *****************************/

  /****************** On receive message *****************************/

  public void oscEvent(OscMessage message) {
    println(message.addrPattern());

    if (message.checkAddrPattern("Server: Send invite"))
      addIp(message.address());
  }

  public void addIp(String ip) {
    if (serverIP != null)
      return;

    ip = ip.split("/")[1]; // For some reason the ip comes like "/192.168.0.1", so i have to remove the bar

    serverIP = ip;
  }
}