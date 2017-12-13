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

  println("Player ", 1, player.get(1).velocity.y, player.get(1).alive);
}

void menu() {
  background(colors.menuBackground);

  menu.drawStartButton();

  menu.onClick();
}