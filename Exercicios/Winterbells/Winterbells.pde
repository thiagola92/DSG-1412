int numberOfPlayers = 1;
int numberOfTargets = 10;

Player[] player;
Target[] target;
Background background;

void setup() {
  size(800, 600);
  mouseX = width/2;
  
  player = new Player[numberOfPlayers];
  target = new Target[numberOfTargets*numberOfPlayers];
  background = new Background();
  
  createPlayers();
  createTargets();
}

void draw() {
  background(0);
  
  updatePlayers();
  updateTargets();
  updateBackground();
  collideTargets();
  
  
  player[0].destination.x = mouseX;
  
  // remove
  if(player[0].collision(mouseX, mouseY, 15))
    fill(255,0,0);
  else
    fill(255);
  
}