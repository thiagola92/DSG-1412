public class Stage {

  int level = 0;
  int bestScore = 0;

  public void update(int points) {

    if (points > bestScore) {
      bestScore = points;

      nextLevel();
    }
  }

  public void nextLevel() {

    if (level == 0 && bestScore >= 10) {
      targetsGravityUp();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();
      numberOfTargetsDown();

      level = 1;
    } else if (level == 1 && bestScore >= 20) {
      playersGravityUp();

      level = 2;
    } else if (level == 2 && bestScore >= 30) {

      level = 3;
    } else if (level == 3 && bestScore >= 40) {
      heightDistanceBetweenTargetsUp();

      level = 4;
    } 
    
  }

  public void playersGravityUp() {

    for (int i = 0; i < player.size(); i++) {
      player.get(i).gravity += 1;
    }
  }

  public void targetsGravityUp() {

    for (int i = 0; i < target.size(); i++) {
      target.get(i).gravity += 1;
    }
  }

  public void heightDistanceBetweenTargetsUp() {

    int lowerJump = 255;
    for (int i = 0; i < player.size(); i++) {
      if (player.get(i).jumpDistance < lowerJump)
        lowerJump = (int)player.get(i).jumpDistance;
    }

    if (heightDistanceBetweenTargets > lowerJump)
      heightDistanceBetweenTargets -= 0.01;
  }
  
  public void widthDistanceBetweenTargetsUp() {
    widthDistanceBetweenTargets += 10;
  }
  
  public void numberOfTargetsDown() {
    
    int farthest = height;
    int index = -1;
    for(int i = 0; i < target.size(); i++) {
      if(target.get(i).position.y < farthest) {
        farthest = (int)target.get(i).position.y;
        index = i;
      }
        
    }
    
    target.remove(index);
  }
}



public void updateLevel() {    
  PFont font = createFont("Aharoni-Bold-100.vlw", 50);
  textFont(font);
  textAlign(CENTER);
  text("Level " + stage.level, width/2 - 25, 40);
}