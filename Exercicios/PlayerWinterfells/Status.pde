public class Status {

  int playerId = -1;
  float accelerometerY;
  color rgb;
  String playerName = "";
  
  String warning = "";

  void draw () {
    textSize(40 * displayDensity);
    
    text("Player: " + playerId, 0, 40 * displayDensity);    
    text(accelerometerY + "", 0, 80 * displayDensity);
    text(playerName, 0, 120 * displayDensity);
    
    text(warning, 0, 160 * displayDensity);
  }
}