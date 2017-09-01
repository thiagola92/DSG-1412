public class Window {
  
  public boolean isObjectOutside(ObjectBase object) {
    if(object.position_x < 0 ||
      object.position_y < 0 ||
      object.position_x > width ||
      object.position_y > height)
      return true;
    
    return false;
  }
  
  public void throwObjectInside(ObjectBase object) {
    while(object.position_x - object.collision.radius < 0) {
      object.position_x += 1;
    }
    while(object.position_y - object.collision.radius < 0) {
      object.position_y += 1;
    }
    while(object.position_x + object.collision.radius > width) {
      object.position_x += -1;
    }
    while(object.position_y + object.collision.radius > height) {
      object.position_y += -1;
    }
  }
  
}