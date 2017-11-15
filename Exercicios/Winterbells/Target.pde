int targetPerScreen = 5;

public class Target {
  
  int radius = 15;
  int gravity = 4;
  
  PVector position;
  
  public Target(int spawnY) {
    
    int spawnPointX = (int)random(width);
    int spawnPointY = (int)-spawnY;
    
    this.position = new PVector(spawnPointX, spawnPointY);
    
  }
  
  public void draw() {
    fill(255);
    ellipse(this.position.x, this.position.y, 2*radius, 2*radius);
  }
  
  public void update() {
    if(this.position.y > height) {
      respawn();
    } else {
      this.position.y += this.gravity;
    }
  }
  
  public void respawn() {
      int distanceBetweenTargets = height/(targetPerScreen * numberOfPlayers);
      
      int spawnPointX = (int)random(width);
      int spawnPointY = (int)-distanceBetweenTargets;
      
      this.position.x = spawnPointX;
      this.position.y = spawnPointY;
  }
  
}

public void createTargets() {
  int distanceBetweenTargets = height/(targetPerScreen * numberOfPlayers);
  
  for(int i = 0; i < target.length; i++) {
    target[i] = new Target(i*distanceBetweenTargets);
  }
}

public void updateTargets() {
  
  for(int i = 0; i < target.length; i++) {
    if(target[i] != null) {
      target[i].update();
      target[i].draw();
    }
  }
  
}

public void collideTargets() {
  
  for(int i = 0; i < player.length; i++) {
    for(int j = 0; j < target.length; j++) {
      if(player[i].collision((int)target[j].position.x, (int)target[j].position.y, target[j].radius)) {
        target[j].respawn();
        player[i].jump();
      }
    }
  }
  
}