enum STATE {
  MENU, PLAYING;
}

void playing() {
  background(colors.gameBackground);

  updateBackground();
  updatePlayers();
  updateTargets();
  updateScores();
  updateLevel();

  collideTargets();

}

void menu() {
  background(colors.menuBackground);

  menu.drawStartButton();

  menu.onClick();
}