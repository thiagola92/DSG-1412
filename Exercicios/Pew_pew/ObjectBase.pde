public class ObjectBase {
  
  public float position_x;
  public float position_y;
  
  public float speed_x;
  public float speed_y;
  
  public float aceleration_x;
  public float aceleration_y;
  
  public ObjectImage image;
  public ObjectCollision collision;
  
  public ObjectBase() {
    position_x = 10;
    position_y = 10;
    
    speed_x = 0;
    speed_y = 0;
    
    aceleration_x = 0;
    aceleration_y = 0;
    
    image = new ObjectImage();
    collision = new ObjectCollision();
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
    image.preDraw(this);
  }
  
  public boolean isColliding(ObjectBase other_object) {
    if(other_object == null) {
      print("null");
      return false;
    }
    return collision.isColliding(this, other_object);
  }
  
}