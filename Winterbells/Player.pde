public class Player {
  
  PVector position;
  PVector velocity;
  PVector destination;
  
  public Player() {
    this.position = new PVector(width/2, height - 30);
    this.velocity = new PVector(5, 0);
    this.destination = new PVector(0, 0);
  }
  
  public void draw() {
    ellipse(position.x, position.y, 30, 30);
  }
  
  public void updatePosition() {
    if(destination.x > position.x && destination.x - position.x > velocity.x)
      position.x += velocity.x;
    else if(destination.x < position.x && position.x - destination.x > velocity.x)
      position.x -= velocity.x;
  }
  
}

void drawPlayers() {
  for(int i = 0; i < player.length; i++) {
    if(player[i] != null)
      player[i].draw();
  }
}

void updatePlayersPosition() {
  for(int i = 0; i < player.length; i++) {
    if(player[i] != null)
      player[i].updatePosition();
  }
}