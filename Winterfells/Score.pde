public class Score {

  String playerName = "NULL";
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
    textAlign(LEFT);
    text(playerName + " :" + points, 0, position);
  }
  
  public void increment() {
    points += 1;
    
    stage.update(points);
  }
  
}

public void updateScores() {
  for(int i = 0; i < score.size(); i++) {
    score.get(i).draw();
  }
}

public void createScores() {
  for(int i = 0; i < numberOfPlayers; i++) {
    score.add(new Score(i));
  }
}