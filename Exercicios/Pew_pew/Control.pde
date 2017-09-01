public class Control {

  public void keyDown() {
    if(key == 'w') {
      player.speed_y += -2;
    } else if(key == 'a') {
      player.speed_x += -2;
    } else if(key == 's') {
      player.speed_y += 2;
    } else if(key == 'd') {
      player.speed_x += 2;
    }
  }

  public void keyHolding() {
  }

  public void keyUp() {
    if(key == 'w') {
      player.speed_y -= -2;
    } else if(key == 'a') {
      player.speed_x -= -2;
    } else if(key == 's') {
      player.speed_y -= 2;
    } else if(key == 'd') {
      player.speed_x -= 2;
    }
  }

  public void mouseDown() {
  }

  public void mouseHolding() {
    GAME_Spaceship spaceship = (GAME_Spaceship)player;
    
    int time_now = millis();
    int interval = abs(time_now - spaceship.time_from_last_shot);
    
    if(interval > 150) {
      objects.addObject(1, new GAME_Shot());
      spaceship.time_from_last_shot = time_now;
    }
  }

  public void mouseUp() {
  }
  
}