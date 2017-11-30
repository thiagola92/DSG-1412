public class Status {

  int playerId = -1;
  float accelerometerY;
  
  String warning = "";

  void draw () {
    textSize(40);
    
    text("Player: " + playerId, 0, 40);    
    text(accelerometerY + "", 0, 80);
    
    text(warning, 0, 120);
  }
}