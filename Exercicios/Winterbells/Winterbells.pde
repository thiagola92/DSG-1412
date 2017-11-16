int numberOfPlayers = 1;
int numberOfTargets = 20;
int targetsPerScreen = 5;

Player[] player;
Target[] target;
Score[] score;
Stage stage;
Background background;

void setup() {
  size(800, 600);
  mouseX = width/2;
  
  player = new Player[numberOfPlayers];
  target = new Target[numberOfTargets*numberOfPlayers];
  score = new Score[numberOfPlayers];
  stage = new Stage();
  background = new Background();
  
  createPlayers();
  createTargets();
  createScores();
}

void draw() {
  background(0);
  
  updatePlayers();
  updateTargets();
  updateScores();
  updateStage();
  updateBackground();
  
  collideTargets();
  
  player[0].destination.x = mouseX;
  
}