public class Target {

  int radius = 15;
  int gravity = 2;

  PVector position;

  public Target(int spawnX, int spawnY) {
    this.position = new PVector(spawnX, spawnY);
  }

  public void draw() {
    fill(255);
    ellipse(position.x, position.y, 2*radius, 2*radius);
  }

  public void update() {
    if (this.position.y > height + radius) {
      respawn();
    } else {
      position.y += gravity;
    }
  }

  public void respawn() {
    float distanceBetweenTargets = height*(heightDistanceBetweenTargets / numberOfPlayers);

    int spawnPointX = (int)random(width);
    int spawnPointY = (int)-distanceBetweenTargets;

    //int farest = height + 30;
    //for (int i = 0; i < target.length; i++) {
    //  if (target[i].position.y < farest) {
    //    farest = (int)target[i].position.y;

    //    spawnPointX = (int)random(target[i].position.x - widthDistanceBetweenTargets, target[i].position.x + widthDistanceBetweenTargets);

    //    if (spawnPointX < 0)
    //      spawnPointX = 0;
    //    else if (spawnPointX > width)
    //      spawnPointX = width;
    //  }
    //}

    //spawnPointY += farest;
    
    position.x = spawnPointX;
    position.y = spawnPointY;
  }
}

public void createTargets() {
  float distanceBetweenTargets = height*(heightDistanceBetweenTargets / numberOfPlayers);
  
  int spawnPointX = (int)random(width);
  int spawnPointY = (int)-distanceBetweenTargets;

  for (int i = 0; i < numberOfTargets; i++) {
    //spawnPointX = (int)random(spawnPointX - widthDistanceBetweenTargets, spawnPointX + widthDistanceBetweenTargets);
    
    spawnPointX = (int)random(width);
    
    //if (spawnPointX < 0)
    //  spawnPointX = 0;
    //else if (spawnPointX > width)
    //  spawnPointX = width;

    target.add(new Target(spawnPointX, i*spawnPointY));
  }
}

public void updateTargets() {

  for (int i = 0; i < target.size(); i++) {
      target.get(i).update();
      target.get(i).draw();
  }
}

public void collideTargets() {

  for (int i = 0; i < player.size(); i++) {
    for (int j = 0; j < target.size(); j++) {
      if (player.get(i).collision((int)target.get(j).position.x, (int)target.get(j).position.y, target.get(j).radius)) {
        target.get(j).respawn();
        player.get(i).jump();
        score.get(i).increment();
      }
    }
  }
}