public class Menu {

  float StartButtonWidth = width*0.3;
  float StartButtonHeight = height*0.065;

  public void drawStartButton() {
    fill(200);

    rectMode(CENTER);
    rect(width/2, height/2, StartButtonWidth, StartButtonHeight);

    fill(255);

    textAlign(CENTER, CENTER);
    textSize(30);
    text("Start Game", width/2, height/2);
  }

  public void onClick() {

    if (mousePressed == true) {
      if (mouseX > width/2 - StartButtonWidth/2 &&
        mouseX < width/2 + StartButtonWidth/2 && 
        mouseY > height/2 - StartButtonHeight/2 && 
        mouseY < height/2 + StartButtonHeight/2) {

        restart();
        state = STATE.PLAYING;
      }
    }
  }
  
  public void restart() {
    
  }
}