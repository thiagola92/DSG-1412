public class Window {
  
  public boolean isObjectOutside(ObjectBase object) {
    if(object.physic.position_x < 0 ||
      object.physic.position_y < 0 ||
      object.physic.position_x > width ||
      object.physic.position_y > height)
      return true;
    
    return false;
  }
  
  public void throwObjectInside(ObjectBase object) {
    while(object.physic.position_x - object.collision.radius < 0) {
      object.physic.position_x += 1;
    }
    while(object.physic.position_y - object.collision.radius < 0) {
      object.physic.position_y += 1;
    }
    while(object.physic.position_x + object.collision.radius > width) {
      object.physic.position_x += -1;
    }
    while(object.physic.position_y + object.collision.radius > height) {
      object.physic.position_y += -1;
    }
  }
  
}