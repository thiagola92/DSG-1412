int numberOfPlayers;

int numberOfTargets;
int widthDistanceBetweenTargets;
float heightDistanceBetweenTargets; // percentage of screen

int port;

STATE state = STATE.MENU;

ArrayList<Player> player;
ArrayList<Target> target;
ArrayList<Score> score;
ArrayList<NetAddress> connection;
Stage stage;
Background background;
Menu menu;
Color colors;

void setup() {
  //fullScreen();
  size(800, 600);
  mouseX = width/2;
  
  colors = new Color();
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
  numberOfPlayers = 2;

  numberOfTargets = 20;
  widthDistanceBetweenTargets = width;
  heightDistanceBetweenTargets = 0.20; // percentage of screen
  
  port = 17000;
  
  player = new ArrayList<Player>();
  target = new ArrayList<Target>();
  score = new ArrayList<Score>();
  connection = new ArrayList<NetAddress>();
  stage = new Stage();
  background = new Background();
 
  createPlayers();
  createConnections();
  createTargets();
  createScores();
}