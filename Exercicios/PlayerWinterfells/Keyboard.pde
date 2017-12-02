public class Keyboard {

  public void writeName() {
    if (key == ENTER || key == RETURN) {
      
    } else if (keyCode == 67) {
      if (status.playerName.length() > 0)
        status.playerName = status.playerName.substring(0, status.playerName.length()-1);
    } else {
      status.playerName = status.playerName + key;
    }
  }
}