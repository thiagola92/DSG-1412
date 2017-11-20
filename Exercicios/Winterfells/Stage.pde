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

      level = 1;
    } else if (level == 1 && bestScore >= 20) {
      playersGravityUp();

      level = 2;
    } else if (level == 2 && bestScore >= 30) {

      level = 3;
    } else if (level == 3 && bestScore >= 40) {
      heightDistanceBetweenTargetsUp();

      level = 4;
    } else if (level == 4 && bestScore >= 50) {
      targetsGravityUp();

      level = 5;
    } else if (level == 5 && bestScore >= 60) {
      playersGravityUp();

      level = 6;
    } else if (level == 6 && bestScore >= 70) {
      heightDistanceBetweenTargetsUp();

      level = 7;
    } else if (level == 7 && bestScore >= 80) {
      targetsGravityUp();

      level = 8;
    } else if (level == 8 && bestScore >= 90) {
      playersGravityUp();

      level = 9;
    } else if (level == 9 && bestScore >= 100) {
      heightDistanceBetweenTargetsUp();

      level = 10;
    } else if (level == 10 && bestScore >= 110) {
      targetsGravityUp();

      level = 11;
    } else if (level == 11 && bestScore >= 120) {
      playersGravityUp();

      level = 12;
    } else if (level == 12 && bestScore >= 130) {
      heightDistanceBetweenTargetsUp();

      level = 13;
    } else if (level == 13 && bestScore >= 140) {
      targetsGravityUp();

      level = 14;
    } else if (level == 14 && bestScore >= 150) {
      playersGravityUp();

      level = 15;
    } else if (level == 15 && bestScore >= 160) {
      heightDistanceBetweenTargetsUp();

      level = 16;
    }
    
    /*
    target gravity ++5
    player gravity ++5
    distance between targets ++5
    */
  }

  public void playersGravityUp() {

    for (int i = 0; i < player.length; i++) {
      player[i].gravity += 1;
    }
  }

  public void targetsGravityUp() {

    for (int i = 0; i < target.length; i++) {
      target[i].gravity += 1;
    }
  }

  public void heightDistanceBetweenTargetsUp() {

    int lowerJump = 255;
    for (int i = 0; i < player.length; i++) {
      if (player[i].jumpDistance < lowerJump)
        lowerJump = (int)player[i].jumpDistance;
    }

    if (heightDistanceBetweenTargets > lowerJump)
      heightDistanceBetweenTargets -= 1;
  }
  
  public void widthDistanceBetweenTargetsUp() {
    widthDistanceBetweenTargets += 10;
  }
}



public void updateLevel() {    
  PFont font = createFont("Aharoni-Bold-100.vlw", 50);
  textFont(font);
  textAlign(CENTER);
  text("Level " + stage.level, width/2 - 25, 40);
}