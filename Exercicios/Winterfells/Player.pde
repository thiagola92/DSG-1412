public class Player {

  int radius = 15;
  int gravity = 1;
  int jumpSpeed = 5;
  float jumpDistance = 0.1; // percentage of screen
  float movSpeed = 0.01;  // percentage of screen
  float sensitivy = 2.0; 
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
    this.destination = new PVector(spawnX, height - 30);
  }

  public void draw() {
    fill(rgb);
    ellipse(position.x, position.y, 2*radius, 2*radius);
  }

  public void update() {

    if (alive == false)
      return;

    if (destination.x > position.x && destination.x - position.x > velocity.x)
      position.x += velocity.x;
    else if (destination.x < position.x && position.x - destination.x > velocity.x)
      position.x -= velocity.x;

    if (destination.y > position.y && destination.y - position.y > velocity.y)
      position.y += velocity.y;
    else if (destination.y < position.y && position.y - destination.y > velocity.y)
      position.y -= velocity.y;


    if (position.y >= destination.y - velocity.y && position.y <= destination.y + velocity.y)
      onDestination();
  }

  public boolean collision(int x, int y, int radius) {

    // Comment to hide hitbox
    //fill(0, 0, 0, 0);
    //stroke(0, 255, 0);
    //ellipse(x, y, 2*radius, 2*radius);
    //noStroke();

    float distanceX = abs(position.x - x);
    float distanceY = abs(position.y - y);
    float distanceTotal = sqrt(distanceX * distanceX + distanceY * distanceY);

    if (this.radius + radius >= distanceTotal)
      return true;

    return false;
  }

  public void jump() {

    velocity.y = jumpSpeed;

    int jump = (int)-(height*jumpDistance);

    if (position.y + jump < 0) {
      destination.y = 0;
    } else {
      destination.y = position.y + jump;
    }

    playing = true;
  }

  public void fall() {

    velocity.y = gravity;

    if (playing) {
      destination.y = height + 30;
    }
  }

  public void onDestination() {

    if (position.y > height + radius) {
      alive = false;
      checkGameover();
    } else {
      fall();
    }
  }

  public void setDirection (float accelerometer) {

    if (accelerometer <= -sensitivy) { //left
      destination.x = 0;
    } else if (accelerometer >= sensitivy) { //right
      destination.x = width;
    } else {
      destination.x = position.x;
    }
  }
}

void createPlayers() {

  for (int i = 0; i < numberOfPlayers; i++) {
    player.add(new Player());
    player.get(i).rgb = colors.player[i];
  }
}

void updatePlayers() {

  for (int i = 0; i < player.size(); i++) {
    player.get(i).update();
    player.get(i).draw();
  }
}

void checkGameover() {

  for (int i = 0; i < player.size(); i++) {
    if (player.get(i).alive == true) {
      return;
    }
  }

  endConnections();

  state = STATE.MENU;
}

String getHighScore() {

  if (player == null)
    return "";

  int highScore = 0;
  int playerName = 0;

  for (int i = 0; i < player.size(); i++) {
    if (score.get(i).points > highScore) {
      highScore = score.get(i).points;
      playerName = i;
    }
  }

  return "Player " + playerName + ": " + highScore;
}