public class Target {

  int radius = 15;
  int gravity = 2;

  PVector position;

  public Target(int spawnY) {

    int spawnPointX = (int)random(width);
    int spawnPointY = (int)-spawnY;

    this.position = new PVector(spawnPointX, spawnPointY);
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
    int distanceBetweenTargets = height/(distanceBetweenTargetsOnScreen * numberOfPlayers);

    int spawnPointX = (int)random(width);
    int spawnPointY = (int)-distanceBetweenTargets;

    int farest = height + 30;
    for (int i = 0; i < target.length; i++) {
      if (target[i].position.y < farest) {
        farest = (int)target[i].position.y;
      }
    }

    spawnPointY += farest;

    position.x = spawnPointX;
    position.y = spawnPointY;
  }
}

public void createTargets() {
  int distanceBetweenTargets = height/(distanceBetweenTargetsOnScreen * numberOfPlayers);

  for (int i = 0; i < target.length; i++) {
    target[i] = new Target(i*distanceBetweenTargets);
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