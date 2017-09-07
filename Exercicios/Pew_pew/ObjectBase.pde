public class ObjectBase {
  
  public ObjectPhysic physic;
  public ObjectImage image;
  public ObjectCollision collision;
  
  public ObjectBase() {
    physic = new ObjectPhysic();
    image = new ObjectImage();
    collision = new ObjectCollision();
  }
  
  public void move() {
    physic.move();
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