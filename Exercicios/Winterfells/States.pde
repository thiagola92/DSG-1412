enum STATE {
  MENU, PLAYING;
}

void playing() {
  background(0);
  
  updateBackground();
  updatePlayers();
  updateTargets();
  updateScores();
  updateLevel();
  
  collideTargets();
  
}

void menu() {
  background(0);
  
  menu.drawStartButton();
  
  menu.onClick();
}