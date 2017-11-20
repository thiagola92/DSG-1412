enum STATE {
  MENU, PLAYING, GAMEOVER;
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

void menu() {
  background(0);
  
  menu.drawStartButton();
  menu.drawConfigButton();
  
  menu.onClick();
}