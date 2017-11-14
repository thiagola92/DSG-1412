int numberOfPlayers = 2;

Player[] player;

void setup() {
  size(800, 600);
  mouseX = width/2;
  
  player = new Player[numberOfPlayers];
  player[0] = new Player();
}

void draw() {
  background(0);
  
  drawPlayers();
  
  player[0].destination.x = mouseX;
  updatePlayersPosition();
  
  println("x = " + player[0].destination.x + ", y = " + player[0].destination.y);
}