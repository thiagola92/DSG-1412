public class Score {

  int points = 0;
  int size = 15;
  
  int position;
  
  PFont scoreFont;
  
  public Score(int i) {
    this.scoreFont = createFont("Aharoni-Bold-100.vlw", size);
    this.position = size*i + size;
  }
  
  public void draw() {
    fill(255);
    textFont(scoreFont);
    text("Player :" + points, 0, position);
  }
  
  public void increment() {
    points += 1;
    
    stage.update(points);
  }
  
}

public void updateScores() {
  for(int i = 0; i < score.length; i++) {
    score[i].draw();
  }
}

public void createScores() {
  for(int i = 0; i < score.length; i++) {
    score[i] = new Score(i);
  }
}