public class ObjectBase {
  
  public int position_x;
  public int position_y;
  
  public int speed_x;
  public int speed_y;
  
  public int aceleration_x;
  public int aceleration_y;
  
  public ObjectImage image;
  
  public ObjectBase() {
    position_x = 0;
    position_y = 0;
    
    speed_x = 0;
    speed_y = 0;
    
    aceleration_x = 0;
    aceleration_y = 0;
    
    image = new ObjectImage();
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
  
  public void draw() {
    image.draw(position_x, position_y);
  }
  
}
