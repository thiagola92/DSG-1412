enum STATE {
  MENU, PLAYING;
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

void menu() {
  background(0);
  
  menu.drawStartButton();
  
  menu.onClick();
}