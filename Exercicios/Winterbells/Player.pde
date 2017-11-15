public class Player {
  
  PVector position;
  PVector velocity;
  PVector destination;
  
  int radius;
  
  public Player() {
    this.position = new PVector(width/2, height - 30);
    this.velocity = new PVector(15, 0);
    this.destination = new PVector(0, 0);
    
    this.radius = 15;
  }
  
  public void draw() {
    fill(0, 200, 255);
    ellipse(position.x, position.y, 2*radius, 2*radius);
  }
  
  public void update() {
    
    if(destination.x > position.x && destination.x - position.x > velocity.x)
      position.x += velocity.x;
    else if(destination.x < position.x && position.x - destination.x > velocity.x)
      position.x -= velocity.x;
      
  }
  
  public boolean collision(int x, int y, int radius) {
    ellipse(x, y, 2*radius, 2*radius);
    
    float distanceX = abs(this.position.x - x);
    float distanceY = abs(this.position.y - y);
    float distanceTotal = sqrt(distanceX * distanceX + distanceY * distanceY);
    
    if(this.radius + radius >= distanceTotal)
      return true;
    
    return false;
  }
  
  public void jump() {
  }
  
}

void createPlayers() {
  
  for(int i = 0; i < player.length; i++) {
    player[i] = new Player();
  }
  
}

void updatePlayers() {
  
  for(int i = 0; i < player.length; i++) {
    if(player[i] != null) {
      player[i].update();
      player[i].draw();
    }
  }
  
}