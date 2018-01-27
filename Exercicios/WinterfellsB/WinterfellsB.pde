import netP5.*;
import oscP5.*;

// Canvas are windows
enum CANVAS {
  MENU, 
    CONFIGURATION, 
    ABOUT, 
    LOADING,
    GAME;
}

CANVAS canvas = CANVAS.MENU;

// Game objects
Settings settings = new Settings();
Connection connection = new Connection();

// Window objects
Menu menu = new Menu();
Configuration configuration = new Configuration();
About about = new About();
Game game = new Game();
Loading loading = new Loading();

void setup() {
  size(800, 600);
  surface.setResizable(true);
  //fullScreen();
  
}

void draw() {

  if (canvas == CANVAS.MENU)
    menu.draw();
  else if (canvas == CANVAS.CONFIGURATION)
    configuration.draw();
  else if (canvas == CANVAS.ABOUT)
    about.draw();
  else if (canvas == CANVAS.LOADING)
    loading.draw();
  else if (canvas == CANVAS.GAME)
    game.draw();
}

void mouseClicked() {

  if (canvas == CANVAS.MENU)
    menu.mouseClicked();
  else if (canvas == CANVAS.CONFIGURATION)
    configuration.mouseClicked();
  else if (canvas == CANVAS.ABOUT)
    about.mouseClicked();
  else if (canvas == CANVAS.LOADING)
    loading.mouseClicked();
  else if (canvas == CANVAS.GAME)
    game.mouseClicked();
}

void keyPressed() {

  if (canvas == CANVAS.MENU)
    menu.keyPressed();
  else if (canvas == CANVAS.CONFIGURATION)
    configuration.keyPressed();
  else if (canvas == CANVAS.ABOUT)
    about.keyPressed();
  else if (canvas == CANVAS.LOADING)
    loading.keyPressed();
  else if (canvas == CANVAS.GAME)
    game.keyPressed();
}