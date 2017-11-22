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
  
  player.get(0).destination.x = mouseX;
  
}

void menu() {
  background(0);
  
  menu.drawStartButton();
  
  menu.onClick();
}