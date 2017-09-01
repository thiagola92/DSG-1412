public class Control {

  public void keyDown() {
    print("key " + key + " down\n");
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
    print("holding key " + key + "\n");
  }

  public void keyUp() {
    print("key " + key + " up\n");
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
    print("mouse button down \n");
  }

  public void mouseHolding() {
    print("holding mouse button \n");
    
    object_list_2.add(new GAME_Shoot());
  }

  public void mouseUp() {
    print("mouse button up \n");
  }
  
}