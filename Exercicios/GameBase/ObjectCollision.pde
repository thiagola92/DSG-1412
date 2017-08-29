public class ObjectCollision {
  
  public int radius;
  
  public ObjectCollision() {
    this.radius = 0;
  }
  
  public ObjectCollision(int radius) {
    this.radius = radius;
  }
  
  public boolean isColliding(int x, int y, ObjectBase other_object) {
    int distance_x = x - other_object.position_x;
    int distance_y = y - other_object.position_y;
    
    int square_x = distance_x*distance_x;
    int square_y = distance_y*distance_y;
    
    float distance = sqrt(square_x+square_y);
    
    int sum_radius = radius + other_object.collision.radius;
    if( distance <= sum_radius)
      return true;
    
    return false;
  }
  
}
