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
}