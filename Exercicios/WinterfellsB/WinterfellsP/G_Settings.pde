public class Settings {

  // Game settings
  int sensitivity = 1;

  // Internet settings
  String netIp = "192.168.0.";
  int port = 17000;

  public void increaseSensitivity() {
    if (sensitivity < 9)
      sensitivity++;
  }

  public void decreaseSensitivity() {
    if (sensitivity > 1)
      sensitivity--;
  }
}