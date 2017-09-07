public class Control {

  public void keyDown() {
    if(key == 'w') {
      player.physic.speed_y += -2;
    } else if(key == 'a') {
      player.physic.speed_x += -2;
    } else if(key == 's') {
      player.physic.speed_y += 2;
    } else if(key == 'd') {
      player.physic.speed_x += 2;
    }
    
    if(key == 'p') {
      score.show = !score.show;
    }
  }

  public void keyHolding() {
  }

  public void keyUp() {
    if(key == 'w') {
      player.physic.speed_y -= -2;
    } else if(key == 'a') {
      player.physic.speed_x -= -2;
    } else if(key == 's') {
      player.physic.speed_y -= 2;
    } else if(key == 'd') {
      player.physic.speed_x -= 2;
    }
  }

  public void mouseDown() {
  }

  public void mouseHolding() {
    if(mouseButton == LEFT) {
      GAME_Spaceship spaceship = (GAME_Spaceship)player;
      spaceship.shoot();
    }
  }

  public void mouseUp() {
  }
  
}