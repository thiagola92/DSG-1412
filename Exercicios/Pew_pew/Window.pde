public class Window {
  
  public int width;
  public int height;
  
  public Window(int width, int height) {
    this.width = width;
    this.height = height;
  }
  
  public boolean isOutOfBound(ObjectBase object) {
    if(object.position_x < 0 ||
      object.position_y < 0 ||
      object.position_x > width ||
      object.position_y > height)
      return true;
    
    return false;
  }
  
}