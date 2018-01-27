public class Connection {

  ArrayList<String> playersIP = new ArrayList<String>(); 

  public OscP5 osc = null;

  /****************** Sending message *****************************/

  public void searchConnections() {
    if (osc == null)
      osc = new OscP5(this, settings.port);

    OscMessage message = new OscMessage("Server: Send invite");

    sendToAllIPs(message);

    if (playersIP.size() == settings.players)
      canvas = CANVAS.GAME;
  }

  public void sendToAllIPs(OscMessage message) {
    for (int i = 0; i < 256 && playersIP.size() != settings.players; i++) {
      NetAddress netAddress = new NetAddress(settings.netIp + i, settings.port);
      osc.send(message, netAddress);
      delay(settings.timeout);
      println(i);
    }
  }

  /****************** Receiving message *****************************/

  public void oscEvent(OscMessage message) {
    println(message.addrPattern());

    if (message.checkAddrPattern("Client: Invite accepted"))
      addIp(message.address());
  }

  public void addIp(String ip) {
    ip = ip.split("/")[1]; // For some reason the ip comes like "/192.168.0.1", so i have to remove the bar

    if (playersIP.size() >= settings.players)
      return;

    if (isAlreadyRegistered(ip))
      return;

    playersIP.add(ip);
  }

  public boolean isAlreadyRegistered(String ip) {
    for (int i = 0; i < playersIP.size(); i++) {
      if (ip.equals(playersIP.get(i)))
        return true;
    }

    return false;
  }
}