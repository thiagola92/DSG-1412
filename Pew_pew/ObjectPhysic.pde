public class ObjectPhysic {
  
  public float position_x = 10;
  public float position_y = 10;
  
  public float speed_x = 0;
  public float speed_y = 0;
  
  public float aceleration_x = 0;
  public float aceleration_y = 0;
  
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