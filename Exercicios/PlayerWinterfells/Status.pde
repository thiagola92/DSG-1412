public class Status {

  int playerId = -1;
  float accelerometerY;

  void draw () {
    textSize(40);
    if (playerId > -1)
      text("Player: " + playerId, width/2, height/2);    


    text(accelerometerY + "", 0, 0, width, height);
  }
}