public class ObjectPhysic {
  
  public float position_x;
  public float position_y;
  
  public float speed_x;
  public float speed_y;
  
  public float aceleration_x;
  public float aceleration_y;
  
  public ObjectPhysic() {
    position_x = 10;
    position_y = 10;
    
    speed_x = 0;
    speed_y = 0;
    
    aceleration_x = 0;
    aceleration_y = 0;
  }
  
  public void move() {
    position_x += speed_x;
    position_y += speed_y;
    acelerate();
  }
  
  public void acelerate() {
    speed_x += aceleration_x;
    speed_y += aceleration_y;
  }
  
}