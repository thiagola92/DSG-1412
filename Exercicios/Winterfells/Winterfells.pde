int numberOfPlayers = 1;

int numberOfTargets = 20;
int heightDistanceBetweenTargets = 10; // bigger == less distance
int widthDistanceBetweenTargets = 50;

boolean gameover = false;

Player[] player;
Target[] target;
Score[] score;
Stage stage;
Background background;

void setup() {
  //fullScreen();
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
  if(gameover == false) {
    playing();
  } else {
    gameover();
  }
}

void playing() {
  background(0);
  
  updatePlayers();
  updateTargets();
  updateScores();
  updateBackground();
  updateLevel();
  
  collideTargets();
  
  player[0].destination.x = mouseX;
  
}

void gameover() {
  background(0);
}