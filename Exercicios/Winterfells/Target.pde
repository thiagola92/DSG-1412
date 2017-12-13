public class Target {

  int radius = 15;
  int gravity = 2;

  PVector position;

  public Target() {
    this.position = new PVector(width/2, 0);
  }

  public void draw() {
    fill(colors.target);

    ellipse(position.x, position.y, 2*radius, 2*radius);
  }

  public void update() {
    if (this.position.y > height + radius) {
      respawn();
    } else {
      position.y += gravity;
    }
  }

  public void collision(int index) {
    respawn();
    player.get(index).jump();
    score.get(index).increment();
  }

  public void respawn() {
    float distanceBetweenTargets = height*(heightDistanceBetweenTargets / numberOfPlayers);

    int spawnPointX = (int)random(width);
    int spawnPointY = (int)-distanceBetweenTargets;

    int farest = height + 30;
    for (int i = 0; i < target.size(); i++) {
      if (target.get(i).position.y < farest) {
        farest = (int)target.get(i).position.y;

        float startSpawnX = target.get(i).position.x - widthDistanceBetweenTargets;
        float endSpawnX = target.get(i).position.x + widthDistanceBetweenTargets;

        if (startSpawnX < 0 && endSpawnX > width) {
          startSpawnX = 0;
          endSpawnX = width;
        } 
        if (startSpawnX < 0) {
          endSpawnX += abs(startSpawnX);
          startSpawnX = 0;
        } else if (endSpawnX > width) {
          startSpawnX += width - endSpawnX;
          endSpawnX = width;
        }

        spawnPointX = (int)random(startSpawnX, endSpawnX);
      }
    }

    spawnPointY += farest;

    position.x = spawnPointX;
    position.y = spawnPointY;
  }
}

public void createTargets() {

  for (int i = 0; i < numberOfTargets; i++) {
    target.add(new Target());
    target.get(i).respawn();
  }

  target.add(new TriangleTarget());
  target.get(target.size()-1).respawn();
  
  target.add(new SquareTarget());
  target.get(target.size()-1).respawn();
  
  target.add(new CrystalTarget());
  target.get(target.size()-1).respawn();
}

public void updateTargets() {

  for (int i = 0; i < target.size(); i++) {
    target.get(i).update();
    target.get(i).draw();
  }
}

public void collideTargets() {

  for (int i = 0; i < player.size(); i++) {
    if(player.get(i).alive == false)
      continue;
      
    for (int j = 0; j < target.size(); j++) {
      
      int x = (int)target.get(j).position.x;
      int y = (int)target.get(j).position.y;
      int radius = target.get(j).radius;
      
      if (player.get(i).collision(x, y, radius))
        target.get(j).collision(i);
    }
  }
}