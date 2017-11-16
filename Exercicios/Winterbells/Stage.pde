public class Stage {

  int level = 0;
  int bestScore = 0;
  
  public void update(int points) {
    if(points > bestScore) {
      nextLevel();
    }
  }
  
  public void nextLevel() {
    if(level == 0 && bestScore >= 10) {
      level1();
    } else if(level == 1 && bestScore >= 30) {
      level2();
    } else if(level == 2 && bestScore >= 70) {
      level3();
    }
  }
  
  public void level1() {
  }
  
  public void level2() {
  }
  
  public void level3() {
  }
}