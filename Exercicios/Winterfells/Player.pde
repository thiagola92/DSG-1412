public class Player {
  
  int radius = 15;
  int gravity = 1;
  int jumpSpeed = 5;
  float jumpDistance = 0.1; // percentage of screen
  float movSpeed = 0.01;  // percentage of screen
  
  color rgb;
  
  boolean playing = false;
  boolean alive = true;
  
  PVector position;
  PVector velocity;
  PVector destination;
  
  public Player() {
    
    float spawnX = width/(1 + numberOfPlayers) * (player.size() + 1);  
    
    this.position = new PVector(spawnX, height - 30);
    this.velocity = new PVector(width*movSpeed, this.gravity);
    this.destination = new PVector(0, height - 30);
    
  }
  
  public void draw() {
    fill(rgb);
    ellipse(position.x, position.y, 2*radius, 2*radius);
  }
  
  public void update() {
    
    if(destination.x > position.x && destination.x - position.x > velocity.x)
      position.x += velocity.x;
    else if(destination.x < position.x && position.x - destination.x > velocity.x)
      position.x -= velocity.x;
      
    if(destination.y > position.y && destination.y - position.y > velocity.y)
      position.y += velocity.y;
    else if(destination.y < position.y && position.y - destination.y > velocity.y)
      position.y -= velocity.y;
      
    if(position.x >= destination.x - velocity.x && position.x <= destination.x + velocity.x) {
      if(position.y >= destination.y - velocity.y && position.y <= destination.y + velocity.y)
        onDestination();
    }
    
  }
  
  public boolean collision(int x, int y, int radius) {
    ellipse(x, y, 2*radius, 2*radius);
    
    float distanceX = abs(position.x - x);
    float distanceY = abs(position.y - y);
    float distanceTotal = sqrt(distanceX * distanceX + distanceY * distanceY);
    
    if(this.radius + radius >= distanceTotal)
      return true;
    
    return false;
  }
  
  public void jump() {
    velocity.y = jumpSpeed;
    
    int jump = (int)-(height*jumpDistance);
    
    if(position.y + jump < 0) {
      destination.y = 0;
    } else {
      destination.y = position.y + jump;
    }
      
    playing = true;
  }
  
  public void fall() {
    velocity.y = gravity;
    
    if(playing) {
      destination.y = height + 30;
    }
  }
  
  public void onDestination() {
    
    if(position.y > height + radius) {
      alive = false;
      checkGameover();
    } else {
      fall();
    }
    
  }
  
  public void setDirection (float acc) {
   
    if (acc <= -2) { //left
      
      if (destination.x - 1 > 0)
        destination.x -= 10;
      
    } else if (acc >= 2) { //right
      
      if (destination.x + 1 < width)
        destination.x += 10;
        
    } else {
      
      destination.x = position.x;
      
    }
    
  }
  
}

void createPlayers() {
  
  for(int i = 0; i < numberOfPlayers; i++) {
    player.add(new Player());
    player.get(i).rgb = colors.player[i];
  }
  
}

void updatePlayers() {
  
  for(int i = 0; i < player.size(); i++) {
      player.get(i).update();
      player.get(i).draw();
  }
  
}

void checkGameover() {
  
  for(int i = 0; i < player.size(); i++) {
    if(player.get(i).alive == true) {
      return;
    }
  }
  
  state = STATE.MENU;
}

String getHighScore() {
  
  if(player == null)
    return "";
  
  int highScore = 0;
  int playerName = 0;
  
  for(int i = 0; i < player.size(); i++) {
    if(score.get(i).points > highScore) {
      highScore = score.get(i).points;
      playerName = i;
    }
  }
  
  return "Player " + playerName + ": " + highScore;
}