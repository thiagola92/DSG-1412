public class Status {

  int playerId = -1;
  float accelerometerY;
  color rgb;
  String playerName = "";

  String warning = "";

  public void draw () {
    fill(255);
    textSize(40 * displayDensity);

    text("Player: " + playerId, 0, 40 * displayDensity);    
    text(accelerometerY + "", 0, 80 * displayDensity);
    text(playerName, 0, 120 * displayDensity);

    fill(100);
    rect(width/2, 0, width/2, 40 * displayDensity);
    fill(255);
    text(" Change name", width/2, 40 * displayDensity);

    text(warning, 0, 160 * displayDensity);
  }

  public void mousePressed() {
    if(mouseX >= width/2 && mouseX <= width && mouseY >= 0 && mouseY <= 40 * displayDensity)
      openKeyboard();
  }
}