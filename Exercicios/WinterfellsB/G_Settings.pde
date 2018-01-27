public class Settings {

  // Game settings
  int players = 1;
  
  // Internet settings
  String netIp = "192.168.0.";
  int port = 17000;
  int timeout = 1;

  public void increasePlayers() {
    players++;
  }

  public void decreasePlayers() {
    if (players > 1)
      players--;
  }
}