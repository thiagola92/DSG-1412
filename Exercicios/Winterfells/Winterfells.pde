int numberOfPlayers = 1;

int numberOfTargets = 20;
int widthDistanceBetweenTargets = 50;
float heightDistanceBetweenTargets = 0.20; // percentage of screen

STATE state = STATE.MENU;

Player[] player;
Target[] target;
Score[] score;
Stage stage;
Background background;
Menu menu;

void setup() {
  //fullScreen();
  size(800, 600);
  mouseX = width/2;
  
  player = new Player[numberOfPlayers];
  target = new Target[numberOfTargets*numberOfPlayers];
  score = new Score[numberOfPlayers];
  stage = new Stage();
  background = new Background();
  menu = new Menu();
  
  createPlayers();
  createTargets();
  createScores();
}

void draw() {
  if(state == STATE.MENU) {
    menu();
  } if(state == STATE.PLAYING) {
    playing();
  } else if(state == STATE.GAMEOVER) {
    gameover();
  }
}