int numberOfPlayers;

int numberOfTargets;
int widthDistanceBetweenTargets;
float heightDistanceBetweenTargets; // percentage of screen

int port;

STATE state = STATE.MENU;

ArrayList<Player> player;
ArrayList<Target> target;
ArrayList<Score> score;
ArrayList<Connection> connection;
Stage stage;
Background background;
Menu menu;

void setup() {
  //fullScreen();
  size(800, 600);
  mouseX = width/2;
  
  menu = new Menu();
}

void draw() {
  if(state == STATE.MENU) {
    menu();
  } if(state == STATE.PLAYING) {
    playing();
  }
}

void restart() {
  numberOfPlayers = 1;

  numberOfTargets = 20;
  widthDistanceBetweenTargets = width;
  heightDistanceBetweenTargets = 0.20; // percentage of screen
  
  port = 17000;
  
  player = new ArrayList<Player>();
  target = new ArrayList<Target>();
  score = new ArrayList<Score>();
  connection = new ArrayList<Connection>();
  stage = new Stage();
  background = new Background();
 
  createConnections();
  createPlayers();
  createTargets();
  createScores();
}