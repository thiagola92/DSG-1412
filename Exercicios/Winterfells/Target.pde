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

    int farest = height + 30;
    for (int i = 0; i < target.length; i++) {
      if (target[i].position.y < farest) {
        farest = (int)target[i].position.y;

        spawnPointX = (int)random(target[i].position.x - widthDistanceBetweenTargets, target[i].position.x + widthDistanceBetweenTargets);

        if (spawnPointX < 0)
          spawnPointX = 0;
        else if (spawnPointX > width)
          spawnPointX = width;
      }
    }

    spawnPointY += farest;

    position.x = spawnPointX;
    position.y = spawnPointY;
  }
}

public void createTargets() {
  float distanceBetweenTargets = height*(heightDistanceBetweenTargets / numberOfPlayers);
  
  int spawnPointX = (int)random(0, width);
  int spawnPointY = (int)distanceBetweenTargets;

  for (int i = 0; i < target.length; i++) {
    spawnPointX = (int)random(spawnPointX - widthDistanceBetweenTargets, spawnPointX + widthDistanceBetweenTargets);

    if (spawnPointX < 0)
      spawnPointX = 0;
    else if (spawnPointX > width)
      spawnPointX = width;

    target[i] = new Target(spawnPointX, -i*spawnPointY);
  }
}

public void updateTargets() {

  for (int i = 0; i < target.length; i++) {
    if (target[i] != null) {
      target[i].update();
      target[i].draw();
    }
  }
}

public void collideTargets() {

  for (int i = 0; i < player.length; i++) {
    for (int j = 0; j < target.length; j++) {
      if (player[i].collision((int)target[j].position.x, (int)target[j].position.y, target[j].radius)) {
        target[j].respawn();
        player[i].jump();
        score[i].increment();
      }
    }
  }
}